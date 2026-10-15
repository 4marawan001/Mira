# Install Mira

Use the device-specific [download table](../README.md#download). The shared channel currently lists iPhone 168, Mac 169 and Fire TV 176. The [audit](AUDIT-2026-10-14.md) explains the corrected iPhone version labels and the delivered iPhone 168 update.

## iPhone

1. Download the IPA for the version you intend to install.
2. Open Sideloadly and connect your iPhone by USB, or use an already configured Wi-Fi connection.
3. Select the IPA. Use the same Apple ID and signing options as your existing Mira installation.
4. Install over Mira; keep the existing app installed to preserve its local data.

The IPA is an unsigned Release package for sideload signing and requires iOS 16.1+. A free developer profile has installation and expiration limits. Sideloadly’s refresh renews signing; new features require a newer IPA.

### Optional update helper

1. Download [Mira-iPhone-Updates-1.1.1-macOS.zip](https://github.com/4marawan001/Mira/releases/download/v0.5.22/Mira-iPhone-Updates-1.1.1-macOS.zip).
2. Extract it and put **Mira iPhone Updates.app** in Applications. Quit any older copy first.
3. Open it, then choose **Check now**. The download is checked against the feed’s SHA-256 and size.
4. Choose **Open in Sideloadly**, confirm the correct IPA/version, and start installation.

Helper 1.1.1 supports Intel and Apple Silicon on macOS 13+. Start at login is optional. The helper checks hourly while running. Sideloadly may require interaction; the helper does not remove signing limits.

If the old helper says the update channel has not been published, replace it with this version and retry. The shared feed has been restored. If multiple helper copies open, quit them and launch the copy in Applications.

## Mac

1. Check **Apple menu → About This Mac**. Choose the ARM64 DMG for an M-series chip or the x86_64 DMG for Intel.
2. Open the disk image and quit an already running Mira.
3. Copy Mira to Applications, replacing the old app.
4. Open Mira from Applications.

Both packages require macOS 12+. They are ad-hoc signed and not Apple-notarized. Account data lives outside the app bundle. Mac checks for updates while running and provides **Install & Restart** after a verified download. Builds 155/156 can need a one-time manual DMG replacement to repair installed-app lookup.

Videos mode and automatic hover-video playback are removed in Mac 165. Poster hover cards are static; normal playback remains available.

## Fire TV

1. Download [Mira-FireTV-universal.apk](https://github.com/4marawan001/Mira/releases/download/v0.5.32/Mira-FireTV-universal.apk).
2. Transfer it to a compatible Android-based Fire TV using your APK installation method.
3. Install over your existing Mira app, then open it.
4. Browse with D-pad, Select and Back. In **Settings → Automatic quality**, choose Low Data, Balanced or Highest.

Build 167 requires Android 7/API 24+. Its signing identity matches the previous Mira TV release. Saved Manual/First Link/Regex preferences remain; existing users must choose Balanced if desired. Physical Insignia testing remains outstanding. [Remote and quality validation](BUILD-167.md).

## Verify a download or report a problem

The [manifest](https://github.com/4marawan001/Mira/releases/latest/download/mira-updates.json) records platform versions, SHA-256 hashes and sizes. Releases that include a checksum file also provide `SHA256SUMS.txt`. On Mac, run `shasum -a 256` followed by the downloaded file path and compare it with the matching entry.

Include the build number, device model, action and exact error text in an issue report. Keep passwords, account data and private add-on URLs out of public reports. [Known limitations and current checks](AUDIT-2026-10-14.md).
