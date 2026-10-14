import Foundation
import CryptoKit

struct Artifact: Decodable { let build: Int; let version: String; let url: URL; let sha256: String; let size: Int64? }
struct Feed: Decodable { let schema: Int; let artifacts: [String:Artifact] }
let feedURL = URL(string: "https://github.com/4marawan001/Mira/releases/latest/download/mira-updates.json")!
let releasesAPI = URL(string: "https://api.github.com/repos/4marawan001/Mira/releases?per_page=20")!
private let releasePrefix = "/4marawan001/Mira/releases/download/"
func trustedAsset(_ url: URL, extension suffix: String) -> Bool {
    guard let parts = URLComponents(url: url, resolvingAgainstBaseURL: false),
          parts.scheme == "https", parts.host == "github.com", parts.port == nil,
          parts.user == nil, parts.password == nil, parts.query == nil, parts.fragment == nil,
          parts.path.hasPrefix(releasePrefix), !parts.path.contains(".."),
          parts.path.dropFirst(releasePrefix.count).split(separator: "/", omittingEmptySubsequences: false).count == 2
    else { return false }
    return url.pathExtension == suffix
}
func validate(_ data: Data) throws -> Artifact {
    let feed = try JSONDecoder().decode(Feed.self, from:data)
    guard feed.schema == 1, let item = feed.artifacts["ios"], item.build > 0, !item.version.trimmingCharacters(in:.whitespacesAndNewlines).isEmpty,
          trustedAsset(item.url, extension: "ipa"), (item.size ?? 1) > 0,
          item.sha256.range(of:"^[a-fA-F0-9]{64}$",options:.regularExpression) != nil
    else { throw NSError(domain:"Mira",code:1,userInfo:[NSLocalizedDescriptionKey:"The update feed is invalid."]) }
    return item
}

private struct Release: Decodable {
    struct Asset: Decodable { let name: String; let browser_download_url: URL }
    let draft: Bool; let prerelease: Bool; let assets: [Asset]
}
/// GitHub Latest can temporarily point at a platform-only release. Use a published
/// manifest from the release list without trusting arbitrary URLs from that list.
func loadArtifact(fetch: (URL) async throws -> (Data, Int)) async throws -> Artifact {
    let (data, status) = try await fetch(feedURL)
    if status == 200 { return try validate(data) }
    guard status == 404 else { throw URLError(.badServerResponse) }
    let (releasesData, releasesStatus) = try await fetch(releasesAPI)
    guard releasesStatus == 200 else { throw URLError(.badServerResponse) }
    let releases = try JSONDecoder().decode([Release].self, from: releasesData)
    for release in releases where !release.draft && !release.prerelease {
        guard let url = release.assets.first(where: {
            $0.name == "mira-updates.json" && trustedAsset($0.browser_download_url, extension: "json")
        })?.browser_download_url else { continue }
        let (candidate, code) = try await fetch(url)
        if code == 404 { continue }
        guard code == 200 else { throw URLError(.badServerResponse) }
        return try validate(candidate)
    }
    throw NSError(domain: "Mira", code: 3, userInfo: [NSLocalizedDescriptionKey:
        "The update channel is temporarily unavailable. Your installed app is unchanged. Try again later."])
}

func cachedDownloadMatches(_ file: URL, artifact: Artifact, downloadedBuild: Int) throws -> Bool {
    guard downloadedBuild == artifact.build, FileManager.default.fileExists(atPath: file.path) else { return false }
    if let expected = artifact.size {
        let bytes = try file.resourceValues(forKeys: [.fileSizeKey]).fileSize
        guard bytes == Int(expected) else { return false }
    }
    return try checksum(file) == artifact.sha256.lowercased()
}
func checksum(_ file: URL) throws -> String {
    let handle = try FileHandle(forReadingFrom:file); defer {try? handle.close()}
    var hash = SHA256()
    while let data = try handle.read(upToCount:1024*1024), !data.isEmpty { hash.update(data:data) }
    return hash.finalize().map {String(format:"%02x",$0)}.joined()
}
