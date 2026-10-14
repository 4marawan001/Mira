import Foundation
import CryptoKit

@main struct FeedChecks {
static func main() async throws {
var checks=0
let hash = String(repeating:"a", count:64)
func feed(_ url:String="https://github.com/4marawan001/Mira/releases/download/v1/Mira.ipa", _ sha:String=String(repeating:"a",count:64), _ build:Int=154, _ schema:Int=1, _ version:String="0.5.9") throws -> Data {
    try JSONSerialization.data(withJSONObject:["schema":schema,"artifacts":["ios":["build":build,"version":version,"url":url,"sha256":sha]]])
}
func rejects(_ data:Data) {do {_ = try validate(data);fatalError("invalid feed accepted")} catch {checks += 1}}
let valid=try validate(feed());assert(valid.build == 154);checks += 1
rejects(try feed("https://github.com/other/Mira/releases/download/v1/file.ipa"))
rejects(try feed("https://github.com/4marawan001/Mira/releases/download/../file.ipa"))
rejects(try feed("https://github.com/4marawan001/Mira/releases/download/v1/file.ipa?x=1"))
rejects(try feed("https://github.com/4marawan001/Mira/releases/download/v1/file.ipa", "bad"))
rejects(try feed("https://github.com/4marawan001/Mira/releases/download/v1/file.ipa", hash, 0))
rejects(try feed("https://github.com/4marawan001/Mira/releases/download/v1/file.ipa", hash, 154, 2))
rejects(try feed("https://github.com/4marawan001/Mira/releases/download/v1/file.ipa", hash, 154, 1, "  "))
let file=FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
try Data("abc".utf8).write(to:file)
let digest=try checksum(file)
assert(digest == "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad");checks += 1
assert(digest != hash);checks += 1
try FileManager.default.removeItem(at:file)


rejects(try feed("https://github.com/4marawan001/Mira/releases/download/v1/file.zip"))
rejects(try feed("https://github.com/4marawan001/Mira/releases/download/v1/%2e%2e/file.ipa"))
rejects(try feed("https://github.com:444/4marawan001/Mira/releases/download/v1/file.ipa"))
let cached = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
defer { try? FileManager.default.removeItem(at: cached) }
try Data("abc".utf8).write(to: cached)
let artifact = Artifact(build: 166, version: "0.5.21", url: valid.url,
    sha256: digest, size: 3)
let matches = try cachedDownloadMatches(cached, artifact: artifact, downloadedBuild: 166)
assert(matches); checks += 1
let wrongBuild = try cachedDownloadMatches(cached, artifact: artifact, downloadedBuild: 165)
assert(!wrongBuild); checks += 1
try Data("abd".utf8).write(to: cached)
let corrupt = try cachedDownloadMatches(cached, artifact: artifact, downloadedBuild: 166)
assert(!corrupt); checks += 1
let releaseURL = URL(string: "https://github.com/4marawan001/Mira/releases/download/v1/mira-updates.json")!
let releases = try JSONSerialization.data(withJSONObject: [
    ["draft": true, "prerelease": false, "assets": [["name": "mira-updates.json", "browser_download_url": releaseURL.absoluteString]]],
    ["draft": false, "prerelease": false, "assets": [["name": "Mira.ipa", "browser_download_url": valid.url.absoluteString]]],
    ["draft": false, "prerelease": false, "assets": [["name": "mira-updates.json", "browser_download_url": releaseURL.absoluteString]]]
])
var requests: [URL] = []
let recovered = try await loadArtifact { url in
    requests.append(url)
    if url == feedURL { return (Data(), 404) }
    if url == releasesAPI { return (releases, 200) }
    assert(url == releaseURL)
    return (try feed(), 200)
}
assert(recovered.build == 154 && requests == [feedURL, releasesAPI, releaseURL]); checks += 1
let direct = try await loadArtifact { url in
    assert(url == feedURL); return (try feed(), 200)
}
assert(direct.build == 154); checks += 1
for code in [403, 500] {
    do {
        _ = try await loadArtifact { _ in (Data(), code) }
        fatalError("HTTP error accepted")
    } catch { checks += 1 }
}
do {
    _ = try await loadArtifact { url in
        if url == feedURL { return (Data(), 404) }
        return (Data("[]".utf8), 200)
    }
    fatalError("missing feed accepted")
} catch { checks += 1 }
print("Passed \(checks) companion feed/checksum checks")
}
}
