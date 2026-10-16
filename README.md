<p align="center"><img src="docs/assets/icon.png" width="112" alt="Mira silver icon" /></p>
<h1 align="center">Mira</h1>
<p align="center">Your media, with room to breathe.</p>
<p align="center">iPhone · Apple Silicon & Intel Mac · Fire TV</p>
<p align="center">
  <img src="https://img.shields.io/badge/iPhone-181-9fabbc?style=flat-square" alt="iPhone build 181" />
  <img src="https://img.shields.io/badge/Mac-181-9fabbc?style=flat-square" alt="Mac build 181" />
  <img src="https://img.shields.io/badge/Fire_TV-180-9fabbc?style=flat-square" alt="Fire TV build 180" />
  <img src="https://img.shields.io/badge/status-personal_testing-242830?style=flat-square" alt="Personal testing builds" />
</p>
<p align="center"><a href="#download">Download</a> · <a href="#inside-mira">Explore</a> · <a href="docs/INSTALL.md">Install</a> · <a href="docs/STATUS.md">Current status</a> · <a href="docs/README.md">Documentation</a></p>

![Mira Home on Mac](docs/assets/home.jpg)

*Real Mac screenshot from build 155. Catalog artwork depends on your sources; the current Mac uses static poster hover cards.*

## Download

| Device | Download | Build |
| :--- | :--- | :--- |
| iPhone | [IPA](https://github.com/4marawan001/Mira/releases/download/v0.5.37/Mira.ipa) | **181** |
| Mac · Apple silicon | [ARM64 DMG](https://github.com/4marawan001/Mira/releases/download/v0.5.37/Mira-macOS-arm64.dmg) | **181** |
| Mac · Intel | [Intel DMG](https://github.com/4marawan001/Mira/releases/download/v0.5.37/Mira-macOS-x86_64.dmg) | **181** |
| Fire TV | [APK](https://github.com/4marawan001/Mira/releases/download/v0.5.36/Mira-FireTV-universal.apk) | **180** |

*iPhone/Mac 0.5.37 · TV 0.5.36. Requires iOS 16.1+, macOS 12+, or Android-based Fire TV API 24+.*

[Installation guide](docs/INSTALL.md) · [Release notes](https://github.com/4marawan001/Mira/releases) · [Checksums and update feed](https://github.com/4marawan001/Mira/releases/latest/download/mira-updates.json)

Install over your current copy to keep its data. iPhone needs signing through Sideloadly. Mac packages are ad-hoc signed and are not Apple-notarized.

## Inside Mira

Home, Search and Saved keep your media close. Browse cinematic artwork, genre shelves and IMDb Top 250 entry points. Profiles live in Settings, including PIN protection. Your enabled add-ons provide catalogs and playback sources.

<table>
<tr>
<td width="35%" align="center"><img src="docs/assets/iphone-168-preview.png" width="250" alt="Mira Home on the iPhone 12 mini simulator" /><br /><sub>iPhone Home · simulator, build 168</sub></td>
<td width="65%" align="center"><img src="docs/assets/firetv-167-home.png" width="590" alt="Mira Home with Fire TV remote navigation" /><br /><sub>Fire TV Home · emulator, build 167</sub></td>
</tr>
</table>

### Play your way

Choose **Low Data**, **Balanced** or **Highest** in playback settings. Mira ranks the links your sources return using device compatibility, resolution and file-size information. Balanced prefers good 1080p on iPhone and compatible 4K on Mac or a capable 4K TV. Mac and TV use a runtime-scaled budget of 40 GB per two hours. The budget is a ceiling, not a target file size.

[Quality modes and examples](docs/FEATURES.md#playback-quality)

### Subtitles that follow the film

Choose a language or a specific subtitle file. Automatic timing can match an external file against a usable embedded subtitle timeline. Built-in captions and manual delay controls remain available. Different cuts, unsupported containers or missing references can still need another file or manual adjustment.

[How subtitle matching works](docs/FEATURES.md#subtitles) · [Build 181 checks](docs/BUILD-181.md)

### Search without the wait

Results appear as providers respond. View All keeps your query and loads later pages as you scroll. Repeated pages and duplicates are filtered. There is no fixed total-result cap; what you can find still depends on provider search and pagination support.

### Make it yours

Choose an accent, app icon and layout in **Look & feel**. iPhone Videos mode adds press-and-hold previews, using a trailer or a supported 30-second excerpt. Mac uses static poster hover cards to keep browsing lighter. Fire TV uses remote focus controls.

[Appearance and previews](docs/FEATURES.md#appearance-and-previews)

## Keeping Mira updated

Mac checks for updates and offers **Install & Restart** after verifying the download. Fire TV uses its update/install flow. For iPhone, the optional [Mac update helper](docs/INSTALL.md#optional-iphone-update-helper) downloads the IPA and opens Sideloadly; signing refresh and feature updates are separate.

GitHub’s **Latest** stays on the TV release because older TV apps need its APK. The shared feed also carries the newer iPhone and Mac versions. Use the device table above for the right package.

## Help and project information

[Install or troubleshoot](docs/INSTALL.md) · [Current testing status](docs/STATUS.md) · [Documentation](docs/README.md) · [Source and release process](docs/RELEASING.md)

Mira is a personal fork of [NuvioMobile](https://github.com/NuvioMedia/NuvioMobile), [NuvioDesktop](https://github.com/NuvioMedia/NuvioDesktop) and [NuvioTV](https://github.com/NuvioMedia/NuvioTV). Complete app source archives and checked patches are attached to the platform releases; this repository holds the documentation and update helper. Upstream licenses and notices are retained. Mira does not host media.
