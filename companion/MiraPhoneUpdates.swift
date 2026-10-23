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
    @Published var loginNeedsApproval = SMAppService.mainApp.status == .requiresApproval
    @Published var automaticallyOpen = UserDefaults.standard.bool(forKey: "automaticallyOpenVerifiedUpdates")
    private var readyBuild = 0
    private var openingSideloadly = false
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.timeoutIntervalForResource = 600
        return URLSession(configuration: configuration)
    }()
    private let folder = FileManager.default.urls(for:.applicationSupportDirectory,in:.userDomainMask)[0].appendingPathComponent("Mira Phone Updates",isDirectory:true)
    func check(force: Bool = false) async {
        guard !busy else {return}; ready = nil; readyBuild = 0; busy = true; defer {busy = false}
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
            let actualCachedBuild = await Task.detached { (try? readIPAIdentity(destination).build) ?? 0 }.value
            if actualCachedBuild > item.build {
                message="The channel lists an older build. Keeping your newer download; no downgrade was made."
                return
            }
            let matches = try await Task.detached {
                try cachedDownloadMatches(destination, artifact: item, downloadedBuild: downloaded)
            }.value
            if matches {
                try await Task.detached { try validateIPA(destination, artifact: item) }.value
                prepared(destination, artifact: item)
                return
            }
            message="Downloading Mira \(item.version)…"
            var downloadRequest = URLRequest(url:item.url); downloadRequest.timeoutInterval=60
            let (temp,downloadResponse) = try await session.download(for:downloadRequest)
            defer { try? FileManager.default.removeItem(at:temp) }
            guard (downloadResponse as? HTTPURLResponse)?.statusCode == 200 else {throw URLError(.badServerResponse)}
            let actual=try await Task.detached {try checksum(temp)}.value
            guard actual == item.sha256.lowercased() else {throw NSError(domain:"Mira",code:2,userInfo:[NSLocalizedDescriptionKey:"The download checksum did not match. Nothing was installed."])}
            try await Task.detached { try validateIPA(temp, artifact: item) }.value
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
            prepared(destination, artifact: item)
        } catch {message=error.localizedDescription}
    }
    private func prepared(_ file: URL, artifact: Artifact) {
        ready = file; readyBuild = artifact.build
        message = "Mira \(artifact.version) (build \(artifact.build)) is verified for iPhone and iPad."
        if shouldAutomaticallyOpen(verifiedBuild: artifact.build,
            lastOpenedBuild: UserDefaults.standard.integer(forKey: "lastOpenedVerifiedBuild"), enabled: automaticallyOpen) {
            openInSideloadly()
        }
    }
    func openInSideloadly() {
        guard let ready, !openingSideloadly else {return}
        guard let app=NSWorkspace.shared.urlForApplication(withBundleIdentifier:"io.sideloadly.sideloadly") else {message="Install Sideloadly on this Mac first.";return}
        openingSideloadly = true
        let openedBuild = readyBuild
        NSWorkspace.shared.open([ready],withApplicationAt:app,configuration:NSWorkspace.OpenConfiguration()) {_,error in
            Task { @MainActor in
                self.openingSideloadly = false
                if let error { self.message = error.localizedDescription; return }
                UserDefaults.standard.set(openedBuild, forKey: "lastOpenedVerifiedBuild")
                self.message = "Opened build \(openedBuild) in Sideloadly. Select your iPhone or iPad, keep AutoRefresh on, then click Start. Repeat for the other device."
            }
        }
    }
    func setAutomaticallyOpen(_ enabled: Bool) {
        automaticallyOpen = enabled
        UserDefaults.standard.set(enabled, forKey: "automaticallyOpenVerifiedUpdates")
        if shouldAutomaticallyOpen(verifiedBuild: readyBuild,
            lastOpenedBuild: UserDefaults.standard.integer(forKey: "lastOpenedVerifiedBuild"), enabled: enabled) {
            openInSideloadly()
        }
    }
    func setLogin(_ enabled:Bool) {
        do {
            if enabled {try SMAppService.mainApp.register()} else {try SMAppService.mainApp.unregister()}
            refreshLoginState()
            if loginNeedsApproval { message = "Approve this helper in System Settings → General → Login Items & Extensions to check after login." }
        }
        catch {message=error.localizedDescription}
    }
    func refreshLoginState() {
        startAtLogin = SMAppService.mainApp.status == .enabled
        loginNeedsApproval = SMAppService.mainApp.status == .requiresApproval
    }
}
@main struct MiraPhoneUpdatesApp: App {
    @StateObject private var model=PhoneUpdates()
    let timer=Timer.publish(every:3600,on:.main,in:.common).autoconnect()
    var body: some Scene {
        WindowGroup("Mira iPhone & iPad Updates") {
            VStack(alignment:.leading,spacing:20) {
                HStack(spacing:14) {
                    Image(systemName:"ipad.and.iphone").font(.system(size:36)).foregroundStyle(.secondary)
                    VStack(alignment:.leading,spacing:4) {Text("Mira iPhone & iPad Updates").font(.title2.bold());Text("One verified download for both devices.").foregroundStyle(.secondary)}
                }
                Text(model.message).textSelection(.enabled).frame(minHeight:42,alignment:.topLeading)
                if model.busy {ProgressView().controlSize(.small)}
                HStack {Button("Check now") {Task {await model.check(force:true)}}.disabled(model.busy)
                    Spacer()
                    Button("Update iPhone or iPad…") {model.openInSideloadly()}.buttonStyle(.borderedProminent).disabled(model.ready == nil || model.busy)
                }
                Divider()
                Toggle("Start at login",isOn:Binding(get:{model.startAtLogin},set:{model.setLogin($0)}))
                if model.loginNeedsApproval {
                    Button("Open Login Items settings") { SMAppService.openSystemSettingsLoginItems() }
                }
                Toggle("Open verified new builds in Sideloadly automatically", isOn: Binding(
                    get: { model.automaticallyOpen }, set: { model.setAutomaticallyOpen($0) }))
                VStack(alignment: .leading, spacing: 5) {
                    Text("Install once for each device").font(.headline)
                    Text("1. Select iPhone or iPad in Sideloadly.")
                    Text("2. Keep the same Apple ID and turn AutoRefresh on.")
                    Text("3. Click Start, then repeat for the other device.")
                    Link("Step-by-step installation and updates", destination: URL(string: "https://github.com/4marawan001/Mira/blob/main/docs/INSTALL.md#automatic-updates-for-iphone-and-ipad")!)
                }.font(.callout)
                Text("Checks and downloads hourly while running. Use USB or configured Wi-Fi for each device. New versions still need Start in Sideloadly; its automatic refresh renews signing separately. This helper does not report a device as updated just because a download opened.")
                    .font(.caption).foregroundStyle(.secondary)
            }.padding(28).frame(width:520).task {await model.check()}
                .onReceive(timer) {_ in Task {await model.check()}}
                .onReceive(NotificationCenter.default.publisher(for: NSApplication.didBecomeActiveNotification)) { _ in model.refreshLoginState() }
        }.windowResizability(.contentSize)
    }
}

