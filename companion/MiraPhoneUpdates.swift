import SwiftUI
import Combine
import CryptoKit
import ServiceManagement

@MainActor final class PhoneUpdates: ObservableObject {
    @Published var message = "Checking for a Mira update…"
    @Published var busy = false
    @Published var ready: URL?
    @Published var version = ""
    @Published var startAtLogin = SMAppService.mainApp.status == .enabled
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.timeoutIntervalForResource = 600
        return URLSession(configuration: configuration)
    }()
    private let folder = FileManager.default.urls(for:.applicationSupportDirectory,in:.userDomainMask)[0].appendingPathComponent("Mira Phone Updates",isDirectory:true)
    func check(force: Bool = false) async {
        guard !busy else {return}; busy = true; defer {busy = false}
        do {
            let item = try await loadArtifact { url in
                var request = URLRequest(url: url)
                request.timeoutInterval = 20
                request.setValue("MiraPhoneUpdates", forHTTPHeaderField: "User-Agent")
                let (data, response) = try await self.session.data(for: request)
                guard let http = response as? HTTPURLResponse else { throw URLError(.badServerResponse) }
                return (data, http.statusCode)
            }
            version=item.version
            let destination=folder.appendingPathComponent("Mira.ipa")
            let downloaded=UserDefaults.standard.integer(forKey:"downloadedBuild")
            if downloaded > item.build {
                message="The channel lists an older build. Keeping your newer download; no downgrade was made."
                return
            }
            let matches = try await Task.detached {
                try cachedDownloadMatches(destination, artifact: item, downloadedBuild: downloaded)
            }.value
            if matches {
                ready=destination;message="Mira \(item.version) is downloaded and ready to install.";return
            }
            message="Downloading Mira \(item.version)…"
            var downloadRequest = URLRequest(url:item.url); downloadRequest.timeoutInterval=60
            let (temp,downloadResponse) = try await session.download(for:downloadRequest)
            defer { try? FileManager.default.removeItem(at:temp) }
            guard (downloadResponse as? HTTPURLResponse)?.statusCode == 200 else {throw URLError(.badServerResponse)}
            let actual=try await Task.detached {try checksum(temp)}.value
            guard actual == item.sha256.lowercased() else {throw NSError(domain:"Mira",code:2,userInfo:[NSLocalizedDescriptionKey:"The download checksum did not match. Nothing was installed."])}
            if let expected = item.size {
                let bytes = try temp.resourceValues(forKeys: [.fileSizeKey]).fileSize
                guard bytes == Int(expected) else { throw URLError(.badServerResponse) }
            }
            try FileManager.default.createDirectory(at:folder,withIntermediateDirectories:true,attributes:[.posixPermissions:0o700])
            let staging=folder.appendingPathComponent("Mira-new.ipa")
            if FileManager.default.fileExists(atPath:staging.path) {try FileManager.default.removeItem(at:staging)}
            try FileManager.default.moveItem(at:temp,to:staging)
            if FileManager.default.fileExists(atPath:destination.path) {_ = try FileManager.default.replaceItemAt(destination,withItemAt:staging)}
            else {try FileManager.default.moveItem(at:staging,to:destination)}
            UserDefaults.standard.set(item.build,forKey:"downloadedBuild")
            ready=destination;message="Ready to install. Sideloadly will sign the update for your iPhone."
        } catch {message=error.localizedDescription}
    }
    func install() {
        guard let ready else {return}
        guard let app=NSWorkspace.shared.urlForApplication(withBundleIdentifier:"io.sideloadly.sideloadly") else {message="Install Sideloadly on this Mac first.";return}
        NSWorkspace.shared.open([ready],withApplicationAt:app,configuration:NSWorkspace.OpenConfiguration()) {_,error in
            if let error {Task {@MainActor in self.message=error.localizedDescription}}
        }
    }
    func setLogin(_ enabled:Bool) {
        do {if enabled {try SMAppService.mainApp.register()} else {try SMAppService.mainApp.unregister()};startAtLogin = SMAppService.mainApp.status == .enabled}
        catch {message=error.localizedDescription}
    }
}
@main struct MiraPhoneUpdatesApp: App {
    @StateObject private var model=PhoneUpdates()
    let timer=Timer.publish(every:3600,on:.main,in:.common).autoconnect()
    var body: some Scene {
        WindowGroup("Mira iPhone Updates") {
            VStack(alignment:.leading,spacing:20) {
                HStack(spacing:14) {
                    Image(systemName:"iphone.and.arrow.forward").font(.system(size:36)).foregroundStyle(.secondary)
                    VStack(alignment:.leading,spacing:4) {Text("Mira iPhone Updates").font(.title2.bold());Text("Automatic downloads. Your Mac handles signing.").foregroundStyle(.secondary)}
                }
                Text(model.message).textSelection(.enabled).frame(minHeight:42,alignment:.topLeading)
                if model.busy {ProgressView().controlSize(.small)}
                HStack {Button("Check now") {Task {await model.check(force:true)}}.disabled(model.busy)
                    Spacer()
                    Button("Open in Sideloadly") {model.install()}.buttonStyle(.borderedProminent).disabled(model.ready == nil || model.busy)
                }
                Divider()
                Toggle("Start at login",isOn:Binding(get:{model.startAtLogin},set:{model.setLogin($0)}))
                Text("Checks hourly while running. Keep your Mac and iPhone on the same Wi-Fi. Sideloadly may require you to click Start; its automatic refresh handles signing expiry separately.")
                    .font(.caption).foregroundStyle(.secondary)
            }.padding(28).frame(width:450).task {await model.check()}
                .onReceive(timer) {_ in Task {await model.check()}}
        }.windowResizability(.contentSize)
    }
}
