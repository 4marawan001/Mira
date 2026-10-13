# Install Mira

Download the package for your device from the [latest release](https://github.com/4marawan001/Mira/releases/latest). Mac build 157 is version 0.5.12. iPhone and Fire TV remain build 155 / version 0.5.10. Read the [testing status](BUILD-157.md#validation) before installing.

## iPhone

1. Download `Mira-ios-155.ipa` to your Mac.
2. Open Sideloadly, connect your iPhone and select the IPA.
3. Use the same Apple ID and signing options you used for your existing Mira installation, then install.
4. Open Mira on your iPhone. Keep the existing app installed when applying an update to preserve its local data.

The IPA is an unsigned Release package for sideload signing. A free developer profile has installation and expiration limits. Sideloadly's signing refresh renews an installed app; new Mira features require installing the newer IPA.

The optional `Mira-iPhone-Updates-macOS.zip` helper checks for new IPAs and opens Sideloadly. Signing or installation may still need your interaction. Download the helper from the release assets.

## Apple Silicon Mac

1. Download `Mira-macOS-arm64.dmg` and open it.
2. Quit Mira if it is already running.
3. Copy Mira into Applications, replacing the existing copy when updating.
4. Open Mira from Applications.

This package is for Apple Silicon, including the M1 MacBook Air. It is ad-hoc signed. App settings and account data are stored separately from the app bundle.

Builds 155 and 156 may fail to locate their installed app when applying a download. Replace the app once using the build 157 DMG to fix this.

Starting with build 157, Mira checks hourly while open and downloads updates automatically. Choose **Install & Restart** when ready; a downloaded update does not interrupt playback. Installation retains the previous app for recovery.

## Fire TV

1. Download `Mira-FireTV-universal.apk` from the release assets.
2. Transfer it to your compatible Android-based Fire TV using your preferred APK installation method.
3. Install it over the existing Mira app when updating, then open Mira.
4. Use the remote's directional pad, Select and Back buttons to browse.

The package includes ARMv7 and ARM64 support and requires Android 7 or later. Build 155 uses the existing Mira signing key so it can update the previous signed release. Physical Insignia TV performance has not been verified.

## Turn on video previews

On iPhone or Mac, go to **Settings → Look & feel → Browsing → Videos**. Hover over a poster on Mac or press and hold on iPhone. Mac build 157 falls back to a muted random excerpt of up to 30 seconds when no trailer resolves and a provider has a direct playable stream. The released iPhone build 155 still requires a supplied trailer or preview clip; an unavailable preview does not mean the full title is unavailable.

Choose **Movies & shows** to return to the default experience. TV does not include this mode.

## Verify a download

Every release includes `SHA256SUMS.txt`. Compare your package's SHA-256 checksum with the matching entry. The live update feed also contains each app package's checksum and expected size.

For an issue report, include the Mira build number, device model, the screen or action involved, and any error text. Keep passwords and private add-on URLs out of public reports.
