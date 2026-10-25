# Install the Mira overhaul preview

[Download the preview packages](https://github.com/4marawan001/Mira/releases/tag/v0.6.0-preview.1) · [Changes](OVERHAUL-PREVIEW.md) · [Validation](VALIDATION-OVERHAUL-PREVIEW.md)

This preview changes the app interfaces. Each platform keeps its existing Mira app identity. Install over your current app to retain its data.

## iPhone and iPad

1. Download the preview’s `Mira.ipa` to your Mac. The same IPA supports iPhone and iPad.
2. Connect the device, unlock it, and trust the Mac if prompted. Use USB for the first installation or if Wi-Fi installation stalls.
3. Open Sideloadly. Select the device and the new IPA. Keep the Apple ID and signing options used for your existing Mira installation.
4. Install over Mira. Do not delete Mira first.
5. Turn AutoRefresh on for this installation. Click Start, keep the device unlocked, and wait for Done / 100%.
6. Open Mira and check Settings → About for 0.6.0 / 194. This completed installation must replace the old IPA in that device’s refresh entry.

Repeat the installation for the second device. A simulator preview does not install anything on a physical iPhone or iPad.

### Updates and signing renewal

This preview is a manual installation. The shared automatic-update feed stays on the earlier channel for this preview; installing it does not change that feed. Use the preview IPA for its Sideloadly refresh entry. The stable helper may still have an older stable IPA in its cache.

Mira checks the shared update feed. The Mac companion downloads an IPA and verifies its build identity, size, and SHA-256 before handing it to Sideloadly. Sideloadly signs and installs it for the selected device.

A signing renewal uses the IPA saved in Sideloadly’s refresh entry. Replace an old entry when installing a new version so the next renewal uses the new IPA. Keep the Mac and refresh helper running when renewal is needed. A new app release and a signing renewal are separate operations; an iPhone or iPad cannot silently install an unsigned IPA by itself.

## Mac

1. Choose the ARM64 DMG for an Apple Silicon Mac, or x86_64 for Intel.
2. Quit Mira, open the DMG, and copy Mira to Applications.
3. Open the replacement app. Account data is stored outside the app bundle.
4. Check Settings for 0.6.0 / 197.

The app checks the shared update feed while running. A verified download can be installed with Install & Restart. These packages require macOS 12 or newer and are ad-hoc signed; Apple notarization is not included.

## Fire TV

1. Download a Fire TV 196 APK from this release. ARMv7 matches the tested Insignia Fire TV. Choose ARM64 only for a 64-bit TV runtime, or universal if unsure. The existing Downloader code points to an earlier stable build, so use this preview release for 196.
2. Transfer it using your existing APK installation method, or use `adb install -r` with your paired TV.
3. Install over Mira and open it. Keep the existing app installed so profiles, sources, and preferences remain available.
4. Use the remote’s D-pad, Select, Back, and Menu. The poster menu can appear before its library status finishes loading.

Installing Mira does not require changing the TV resolution or disabling the Home-button helper.

## Android phone or tablet

1. Download the Android phone/tablet APK matching the device CPU. Most current phones and tablets use `arm64-v8a`; older 32-bit ARM devices use `armeabi-v7a`. The `x86` and `x86_64` packages are for compatible Intel devices or emulators. There is no universal mobile APK in this release.
2. Open the APK using your existing installation method and update the installed app.
3. Open Mira and check 0.6.0 / 195. Use Settings for interface and quality preferences.

The Android updater now reads Mira releases. The beta channel can include previews; stable excludes prereleases. Downloads are checked for CPU/build, package and signing identity, and Android asks before installation. If the installer reports an incompatible signature, retain the existing app; updating in place requires its existing signer.

## Choose an interface

Open Settings, then Appearance or Look & feel, and select Mira, Apple TV, Netflix, Cinema, or Library. Customize that interface’s corners, artwork, spacing, navigation, motion, colors, Saved layout, and episode layout. Choices are saved separately for each interface and profile on that device.

Balanced targets 4K on iPad and Mac. Actual playback depends on the selected file, connection, decoder, and display. Highest can retain larger alternatives; a resolution label does not guarantee that every device can play the file.

## Subtitles and source availability

Choose English or Arabic in the subtitle panel. Prefer a track matching the release and episode. The delay controls adjust a fixed offset; they cannot correct every subtitle made for a different cut or frame rate. Keep embedded tracks and manual selection available when automatic matching is unsuitable.

The saved account and add-on setup were preserved. Provider availability can change, and a cached label does not guarantee that a link will open. If a source fails, choose another available source. No live TV or sports playlist has been added.
