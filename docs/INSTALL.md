# Install and update Mira

[Downloads](../README.md#download) · [Quality settings](FEATURES.md#playback-quality) · [Testing status](STATUS.md)

iPhone and iPad share **Mira 0.5.38 / build 182**, supplied as one universal IPA. Mac is build 182; Fire TV is build 180. The separate Mac update helper is version **1.2.0**.

## iPhone

For an update, leave Mira installed and keep its existing Apple ID and bundle/signing options.

1. Install [Sideloadly from its official website](https://sideloadly.io/) on your Mac. Download [Mira.ipa](https://github.com/4marawan001/Mira/releases/download/v0.5.38/Mira.ipa).
2. Connect the iPhone with a USB data cable, unlock it and tap **Trust** if asked. An already paired Wi-Fi connection also works.
3. Open Sideloadly and select your **iPhone** in the device list, rather than Apple Silicon/the Mac.
4. Select **Mira.ipa** and your signing Apple ID. Complete any Apple sign-in prompts yourself.
5. Turn **AutoRefresh** on. Allow Sideloadly's refresh helper to start at Mac login when prompted so signing renewals remain available.
6. Click **Start**, keep the phone unlocked and wait for **Done / 100%**.
7. If requested, enable **Settings → Privacy & Security → Developer Mode** and complete its restart/confirmation. If the phone reports an untrusted developer, review and trust the signing profile in **Settings → General → VPN & Device Management**.
8. Open Mira and check **Settings → About** for **0.5.38 / 182**. Choose **Balanced** in playback quality for the iPhone's 1080p preference.

## iPad, including M1 iPad Air

The same IPA supports iPadOS 16.1 or newer.

1. Download the same [Mira.ipa](https://github.com/4marawan001/Mira/releases/download/v0.5.38/Mira.ipa) to your Mac and open Sideloadly.
2. Connect and unlock the iPad, then tap **Trust** if asked. Wi-Fi works after the iPad has been paired and Wi-Fi sync configured.
3. Select the **iPad** in Sideloadly's device list. Check its name before proceeding.
4. Select **Mira.ipa**. For an existing installation, retain its Apple ID/signing options and leave Mira installed.
5. Turn **AutoRefresh** on for this installation too. iPhone enrollment does not enroll the iPad.
6. Click **Start**, keep the iPad unlocked and wait for **Done / 100%**.
7. Complete Developer Mode or signing-profile trust if requested, using the Settings paths above.
8. Open Mira, check **Settings → About** for **0.5.38 / 182**, then choose **Balanced** in playback quality. On iPad, Balanced targets compatible **4K / 2160p** sources and can fall back when a suitable source is unavailable.

M1 iPad Air supports hardware H.264/HEVC decoding. Its built-in screen is 2360 × 1640, so a 4K source is scaled to the display. [Apple specifications](https://support.apple.com/en-us/111887). Codec, file size and source readiness still influence Mira's choice. [iPad test results](https://github.com/4marawan001/Mira/releases/download/v0.5.38/IPAD-VALIDATION.md) include an open simulator HLS failure; physical iPad playback remains unverified.

## Automatic updates for iPhone and iPad

The Mac helper checks and downloads a verified universal IPA automatically. It can open a new build in Sideloadly once. New feature versions still require **Start** for each device; Sideloadly's **AutoRefresh** separately renews the installed version's signing before expiry.

### Install the Mac helper

1. Download [Mira-iPhone-iPad-Updates-1.2.0-macOS.zip](https://github.com/4marawan001/Mira/releases/download/v0.5.38/Mira-iPhone-iPad-Updates-1.2.0-macOS.zip).
2. Quit an older **Mira iPhone Updates** helper and move that old helper app from Applications to Trash. Extract the ZIP and move **Mira iPhone & iPad Updates.app** to **Applications**. Keep one helper copy; its bundle identity and existing download cache are retained.
3. Open the helper from Applications. It supports Intel and Apple Silicon Macs on macOS 13 or newer. This personal build is ad-hoc signed; [Apple explains opening apps from outside the App Store](https://support.apple.com/en-us/102445).
4. Enable **Start at login**. If macOS requests approval, use **Open Login Items settings** and approve the helper in System Settings.
5. Enable **Open verified new builds in Sideloadly automatically** if you want automatic handoff. The helper checks on opening and hourly while running. It validates the checksum, size, identity, version and support for both devices, and refuses an older feed build than its newer cached IPA.
6. Choose **Update iPhone or iPad…** for the current download. In Sideloadly select the first device, retain its signing Apple ID, enable **AutoRefresh** and click **Start**.
7. When it finishes, select the other device and install the same IPA with that device's existing signing details and **AutoRefresh** on. Check the version on both devices.

The helper tracks handoff to Sideloadly, not completed device installation. Its manual update button stays available for the second device. It stores no Apple ID password and does not change Sideloadly's account or device selection.

### Let signing renew over Wi-Fi

1. Pair each device with the Mac once by USB.
2. In Finder, select that device under **Locations**, enable **Show this device when on Wi-Fi**, and apply the change. Repeat for the other device.
3. Keep the Mac and devices on the same Wi-Fi, with Sideloadly's refresh helper running. The Mac must be awake and each device reachable for renewal; keeping its screen on can help detection.
4. Check that Mira is enrolled separately for each device. Free signing normally lasts seven days; automatic refresh needs the Mac and renews the cached version.
5. For a new Mira version, finish installation for **both** devices with AutoRefresh on. That replaces each device's previous cached IPA. Downloading an IPA alone does not replace an old refresh entry.

If Mira reverts, open the new IPA again, confirm the selected device/account/version, enable AutoRefresh and let installation finish. Check the device's version afterward. [Sideloadly's official instructions](https://sideloadly.io/faq.html) explain the same Apple/bundle identity requirement.

<a id="optional-iphone-update-helper"></a>
The former iPhone-only helper link now leads here; helper 1.2.0 supports both devices.

## Mac

1. Open **Apple menu → About This Mac**. Choose [Apple Silicon DMG](https://github.com/4marawan001/Mira/releases/download/v0.5.38/Mira-macOS-arm64.dmg) for an M-series chip or [Intel DMG](https://github.com/4marawan001/Mira/releases/download/v0.5.38/Mira-macOS-x86_64.dmg) for Intel.
2. Open the downloaded disk image and quit an already running Mira.
3. Drag **Mira.app** into **Applications**, replacing the old app when updating. Account data is stored outside the app bundle.
4. Open Mira from Applications. Packages require macOS 12 or newer and are ad-hoc signed, not notarized; review any first-launch prompt using [Apple's instructions](https://support.apple.com/en-us/102445).
5. For later versions, Mira checks while running and offers **Install & Restart** after verifying the download. Builds 155/156 may need one manual DMG replacement to repair installed-app lookup.
6. Choose **Balanced** in playback settings for compatible 4K sources. The separate iPhone/iPad helper is only needed for those devices.

## Fire TV

1. Open **Downloader by AFTVnews** on the TV.
2. Enter **5568010** in its URL/code field and choose **Go**.
3. Let the redirect countdown finish, then choose **Install** when the APK downloads. If Fire OS requests permission, allow Downloader to install apps.
4. Install over your existing Mira app to retain its data, then open it.
5. Browse with D-pad, Select and Back. In **Settings → Automatic quality**, choose Low Data, Balanced or Highest.
6. For later releases, use Mira's update/install prompt or the same Downloader code. Fire OS still asks you to confirm installation.

The [Downloader code](https://aftv.news/5568010) points to the current universal TV APK, build 180. You can also [download the APK directly](https://github.com/4marawan001/Mira/releases/latest/download/Mira-FireTV-universal.apk). The package requires Android 7/API 24 or newer and retains Mira's signing identity. [TV checks and remaining issues](BUILD-180.md).

## Verify a download or report a problem

The [manifest](https://github.com/4marawan001/Mira/releases/latest/download/mira-updates.json) records app versions, hashes and sizes. The helper has a separate `Mira-iPhone-iPad-Updates-1.2.0-SHA256SUMS.txt` release asset. On Mac, use `shasum -a 256` followed by a file path and compare it with the checksum entry.

Include the build, device model, action and exact error in an issue report. Keep passwords and private add-on URLs out of public reports. [Known limitations](STATUS.md).
