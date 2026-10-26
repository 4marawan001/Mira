<p align="center"><img src="docs/assets/icon.png" width="112" alt="Mira silver icon" /></p>
<h1 align="center">Mira</h1>
<p align="center">Your media, with room to breathe.</p>
<p align="center">iPhone · iPad · Apple Silicon & Intel Mac · Fire TV · Android phone/tablet</p>
<p align="center">
  <img src="https://img.shields.io/badge/iPhone-182-9fabbc?style=flat-square" alt="iPhone build 182" />
  <img src="https://img.shields.io/badge/Mac-182-9fabbc?style=flat-square" alt="Mac build 182" />
  <img src="https://img.shields.io/badge/Fire_TV-180-9fabbc?style=flat-square" alt="Fire TV build 180" />
  <img src="https://img.shields.io/badge/status-personal_testing-242830?style=flat-square" alt="Personal testing builds" />
</p>
<p align="center"><a href="#download">Download</a> · <a href="#inside-mira">Explore</a> · <a href="docs/INSTALL.md">Install</a> · <a href="docs/STATUS.md">Current status</a> · <a href="docs/README.md">Documentation</a></p>

![Mira Home on Mac](docs/assets/home.jpg)

*Real Mac screenshot from build 155. Catalog artwork depends on your sources; the current Mac uses static poster hover cards.*

## Download

**TV interface update:** [build 199](https://github.com/4marawan001/Mira/releases/tag/v0.6.1-tv.1) keeps the original Mira TV look and brings the four alternate designs closer to the Mac layouts. [Changes and TV-specific differences](docs/TV-INTERFACES-199.md).

**Mac updater repair:** [build 198 · 0.6.1-preview.1](https://github.com/4marawan001/Mira/releases/tag/v0.6.1-preview.1) fixes the “Release changed” preview-download error. Older Mac builds need one manual replacement. [Repair and installation steps](docs/MAC-UPDATER-198.md).

**[Mira 0.6.0 overhaul preview](https://github.com/4marawan001/Mira/releases/tag/v0.6.0-preview.1)** is available for manual installation. It adds five interface designs, more customization, TV menu/startup fixes, the Mac player runtime repair, Android updater checks and an empty Live TV section for a future playlist. [What changed and remaining checks](docs/OVERHAUL-PREVIEW.md) · [Install the preview](docs/INSTALL-OVERHAUL-PREVIEW.md).

| Device | Preview download | Build |
| :--- | :--- | :--- |
| iPhone & iPad | [Universal IPA](https://github.com/4marawan001/Mira/releases/download/v0.6.0-preview.1/Mira.ipa) | **194** |
| Mac · Apple silicon | [ARM64 DMG](https://github.com/4marawan001/Mira/releases/download/v0.6.1-preview.1/Mira-macOS-arm64.dmg) | **198** |
| Mac · Intel | [Intel DMG](https://github.com/4marawan001/Mira/releases/download/v0.6.1-preview.1/Mira-macOS-x86_64.dmg) | **198** |
| Fire TV | [ARMv7](https://github.com/4marawan001/Mira/releases/download/v0.6.1-tv.1/Mira-FireTV-armv7.apk) · [ARM64](https://github.com/4marawan001/Mira/releases/download/v0.6.1-tv.1/Mira-FireTV-arm64.apk) · [Universal](https://github.com/4marawan001/Mira/releases/download/v0.6.1-tv.1/Mira-FireTV-universal.apk) | **199** |
| Android phone/tablet | [ARM64](https://github.com/4marawan001/Mira/releases/download/v0.6.0-preview.1/Mira-Android-195-arm64-v8a.apk) · [ARMv7](https://github.com/4marawan001/Mira/releases/download/v0.6.0-preview.1/Mira-Android-195-armeabi-v7a.apk) · [x86](https://github.com/4marawan001/Mira/releases/download/v0.6.0-preview.1/Mira-Android-195-x86.apk) · [x86_64](https://github.com/4marawan001/Mira/releases/download/v0.6.0-preview.1/Mira-Android-195-x86_64.apk) | **195** |

The preview still drops frames during fast TV scrolling. Physical iPhone/iPad/Android playback, HDR output and actual English/Arabic subtitle timing remain unverified. Some specialist screens retain shared controls. GitHub Latest, the stable feed and Downloader code continue to serve the earlier releases.

### Earlier stable builds

| Device | Download | Build |
| :--- | :--- | :--- |
| iPhone & iPad | [IPA](https://github.com/4marawan001/Mira/releases/download/v0.5.38/Mira.ipa) | **182** |
| Mac · Apple silicon | [ARM64 DMG](https://github.com/4marawan001/Mira/releases/download/v0.5.38/Mira-macOS-arm64.dmg) | **182** |
| Mac · Intel | [Intel DMG](https://github.com/4marawan001/Mira/releases/download/v0.5.38/Mira-macOS-x86_64.dmg) | **182** |
| Fire TV | [APK](https://github.com/4marawan001/Mira/releases/download/v0.5.36/Mira-FireTV-universal.apk) | **180** |

*iPhone/iPad/Mac 0.5.38 · TV 0.5.36. Requires iOS or iPadOS 16.1+, macOS 12+, or Android-based Fire TV API 24+.*

**On your TV:** enter **5568010** in Downloader. [Step-by-step installation](docs/INSTALL.md#fire-tv).

[Installation guide](docs/INSTALL.md) · [Release notes](https://github.com/4marawan001/Mira/releases) · [Checksums and update feed](https://github.com/4marawan001/Mira/releases/latest/download/mira-updates.json)

Install over your current copy to keep its data. iPhone and iPad use the same universal IPA and need signing through Sideloadly. Mac packages are ad-hoc signed and are not Apple-notarized.

M1 iPad Air uses this same IPA. [iPad simulator verification](https://github.com/4marawan001/Mira/releases/download/v0.5.38/IPAD-VALIDATION.md) covers Home, Search, Saved, catalog scrolling and rotation. Local H.264 video rendered; an Apple HLS sample remained buffering with HTTP 400 playlist errors. Physical iPad installation and hardware performance testing remain pending.

## Inside Mira

Home, Search and Saved keep your media close. Browse cinematic artwork, genre shelves and IMDb Top 250 entry points. Profiles live in Settings, including PIN protection. Your enabled add-ons provide catalogs and playback sources.

<table>
<tr>
<td width="35%" align="center"><img src="docs/assets/iphone-168-preview.png" width="250" alt="Mira Home on the iPhone 12 mini simulator" /><br /><sub>iPhone Home · simulator, build 168</sub></td>
<td width="65%" align="center"><img src="docs/assets/firetv-167-home.png" width="590" alt="Mira Home with Fire TV remote navigation" /><br /><sub>Fire TV Home · emulator, build 167</sub></td>
</tr>
</table>

### Play your way

Choose **Low Data**, **Balanced** or **Highest** in playback settings. Mira ranks the links your sources return using device compatibility, resolution and file-size information. Balanced targets good 1080p on iPhone and compatible 4K on iPad, Mac or a capable 4K TV. Mac and TV use a runtime-scaled budget of 40 GB per two hours. The budget is a ceiling, not a target file size.

[Quality modes and examples](docs/FEATURES.md#playback-quality)

### Subtitles that follow the film

Choose a language or a specific subtitle file. Automatic timing can match an external file against a usable embedded subtitle timeline. Built-in captions and manual delay controls remain available. Manual calibration keeps the applied cue times and cancels pending automatic work. Different cuts, unsupported containers or missing references can still need another file or manual adjustment.

[How subtitle matching works](docs/FEATURES.md#subtitles) · [Build 182 checks](docs/BUILD-182.md)

### Search without the wait

Results appear as providers respond. View All keeps your query and loads later pages as you scroll. Repeated pages and duplicates are filtered. There is no fixed total-result cap; what you can find still depends on provider search and pagination support.

### Make it yours

Choose an accent, app icon and layout in **Look & feel**. iPhone Videos mode adds press-and-hold previews, using a trailer or a supported 30-second excerpt. Mac uses static poster hover cards to keep browsing lighter. Fire TV uses remote focus controls.

[Appearance and previews](docs/FEATURES.md#appearance-and-previews)

## Keeping Mira updated

Mac checks for updates and offers **Install & Restart** after verifying the download. Fire TV uses its update/install flow. For iPhone and iPad, the [Mac update helper 1.2.0](https://github.com/4marawan001/Mira/releases/download/v0.5.38/Mira-iPhone-iPad-Updates-1.2.0-macOS.zip) automatically downloads the verified universal IPA and can open new builds in Sideloadly. Click Start for each device; Sideloadly then renews signing separately. [Step-by-step setup](docs/INSTALL.md#automatic-updates-for-iphone-and-ipad).

GitHub’s **Latest** stays on the TV release because older TV apps need its APK. The shared feed also carries the newer iPhone/iPad and Mac versions. Use the device table above for the right package.

## Help and project information

[Install or troubleshoot](docs/INSTALL.md) · [Current testing status](docs/STATUS.md) · [Documentation](docs/README.md) · [Source and release process](docs/RELEASING.md)

Mira is a personal fork of [NuvioMobile](https://github.com/NuvioMedia/NuvioMobile), [NuvioDesktop](https://github.com/NuvioMedia/NuvioDesktop) and [NuvioTV](https://github.com/NuvioMedia/NuvioTV). Complete app source archives and checked patches are attached to the platform releases; this repository holds the documentation and update helper. Upstream licenses and notices are retained. Mira does not host media.

