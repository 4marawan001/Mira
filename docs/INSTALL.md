# Install Mira

Use the device-specific [download links in the README](../README.md#download). Current versions are iPhone 161 (0.5.16), Fire TV 162 (0.5.17), and Mac 163 (0.5.18). Read the [validation notes](BUILD-162.md) before installing.

## iPhone

1. Download `Mira-ios-161.ipa` to your Mac.
2. Open Sideloadly, connect your iPhone and select the IPA.
3. Use the same Apple ID and signing options you used for your existing Mira installation, then install.
4. Open Mira on your iPhone. Keep the existing app installed when applying an update to preserve its local data.

The IPA is an unsigned Release package for sideload signing. A free developer profile has installation and expiration limits. Sideloadly's signing refresh renews an installed app; new Mira features require installing the newer IPA.

The optional `Mira-iPhone-Updates-macOS.zip` helper checks for new IPAs and opens Sideloadly. Signing or installation may still need your interaction. Download the helper from the release assets.

## Mac (Apple Silicon or Intel)

1. On Apple Silicon, download `Mira-macOS-arm64.dmg`; on Intel, download `Mira-macOS-x86_64.dmg`. Open the disk image.
2. Quit Mira if it is already running.
3. Copy Mira into Applications, replacing the existing copy when updating.
4. Open Mira from Applications.

Both packages require macOS 12 or later. Check **Apple menu → About This Mac**: an M-series chip needs Apple Silicon; an Intel processor needs Intel. Packages are ad-hoc signed and are not Apple-notarized. App settings and account data are stored separately from the app bundle.

Builds 155 and 156 may fail to locate their installed app when applying a download. Replace the app once using the latest Mac DMG to fix this.

Starting with build 157, Mira checks hourly while open and downloads updates automatically. Choose **Install & Restart** when ready; a downloaded update does not interrupt playback. Installation retains the previous app for recovery.

## Fire TV

1. Download `Mira-FireTV-universal.apk` from the release assets.
2. Transfer it to your compatible Android-based Fire TV using your preferred APK installation method.
3. Install it over the existing Mira app when updating, then open Mira.
4. Use the remote's directional pad, Select and Back buttons to browse.

The package includes ARMv7 and ARM64 support and requires Android 7 or later. Build 162 uses the official Mira signing key so it seamlessly updates the previous signed release. Remote controls and D-pad navigation are fully supported.

## Turn on video previews

On iPhone or Mac, go to **Settings → Look & feel → Browsing → Videos**. Hover over a poster on Mac or press and hold on iPhone. iPhone build 161 falls back to a muted excerpt starting at 0:20 for up to 30 seconds; Mac build 162 retains its muted random excerpt of up to 30 seconds when no trailer resolves and a provider has a direct playable stream. An unavailable preview does not mean the full title is unavailable. Excerpts require a playable, seekable direct stream with a reported duration.

Choose **Movies & shows** to return to the default experience. TV does not include this mode.

## Verify a download

Every release includes `SHA256SUMS.txt`. Compare your package's SHA-256 checksum with the matching entry. The live update feed also contains each app package's checksum and expected size.

For an issue report, include the Mira build number, device model, the screen or action involved, and any error text. Keep passwords and private add-on URLs out of public reports.

## Balanced playback on Mac

Choose **Settings → Playback → Balanced**. The choice is saved on this Mac. Balanced prefers suitable 4K and uses the Mac's hardware-decoder capabilities to rank codecs. For a two-hour movie, known file size must be at most 30 decimal GB; known duration scales this budget. Missing duration uses two hours. Oversized and unknown-size sources remain available for manual selection. Choose Highest if you want to prioritize original-quality disc remuxes regardless of that budget. Provider labels do not guarantee stream compatibility or correct file sizes.

Mac build 163 changes Low Data to prefer smaller 1080p copies. It retains lower-resolution fallback and the existing device-specific codec ranking.
