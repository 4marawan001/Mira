<p align="center">
  <img src="docs/assets/icon.png" alt="Mira silver app icon" width="112" />
</p>

<h1 align="center">Mira</h1>

<p align="center">A personal media app with cinematic browsing and a quieter interface.</p>
<p align="center">iPhone · Apple Silicon Mac · Fire TV</p>

<p align="center">
  <a href="https://github.com/4marawan001/Mira/releases/latest"><img src="https://img.shields.io/github/v/release/4marawan001/Mira?style=flat-square&label=latest&color=9fabbc" alt="Latest release" /></a>
  <a href="https://github.com/4marawan001/Mira/releases"><img src="https://img.shields.io/badge/builds-personal%20testing-242830?style=flat-square" alt="Personal testing builds" /></a>
</p>

<p align="center">
  <a href="#download">Download</a> · <a href="#inside-mira">Inside Mira</a> · <a href="docs/INSTALL.md">Installation</a> · <a href="docs/BUILD-155.md">Build 155 notes</a>
</p>

![Mira Home on Mac, with cinematic artwork, genre shortcuts, IMDb Top 250 and floating navigation](docs/assets/home.jpg)

<p align="center"><sub>Real screenshots from the Mac app, build 155. Artwork and available titles depend on your catalogs.</sub></p>

## Download

Current release: **0.5.10 · build 155**. All three packages are Release builds.

| Device | Download | Installation |
| --- | --- | --- |
| iPhone | [IPA](https://github.com/4marawan001/Mira/releases/download/v0.5.10/Mira-ios-155.ipa) | Sign and install with Sideloadly on your Mac. |
| Apple Silicon Mac | [DMG](https://github.com/4marawan001/Mira/releases/download/v0.5.10/Mira-macOS-arm64.dmg) | Open the disk image and copy Mira to Applications. |
| Fire TV | [APK](https://github.com/4marawan001/Mira/releases/download/v0.5.10/Mira-FireTV-universal.apk) | Install on a compatible Android-based Fire TV. Remote controls are supported. |

[All releases and source downloads](https://github.com/4marawan001/Mira/releases) · [Step-by-step setup](docs/INSTALL.md) · [Build 155 checksums](https://github.com/4marawan001/Mira/releases/download/v0.5.10/SHA256SUMS.txt)

## Inside Mira

Mira is a personal fork of the open-source Nuvio apps. Home puts artwork first, with genre shortcuts, IMDb Top 250 entry points and compact poster shelves. Home, Search and Saved use a consistent navigation style on iPhone and Mac; TV adapts browsing for the remote.

Search shows results as individual add-ons respond and loads more on demand. Queries stay intact when opening View All and later pages. Duplicate detection and repeated-page protection keep providers from filling the list endlessly. The app has no fixed total-result cap, but results still depend on each provider's search support and available pages.

Playback preferences include Low Data, Balanced and Highest. Balanced favors good 1080p sources for the iPhone 12 mini while reducing the preference for oversized files. Highest favors resolution and disc sources. These choices rank the metadata providers return; they do not measure your internet speed or guarantee playback quality.

### Movies or videos

On iPhone and Mac, open **Settings → Look & feel → Browsing**. Movies & shows is the default. Videos enables muted hover previews on Mac and press-and-hold preview sheets on iPhone. Previews use supplied trailers or preview clips, so some titles have none.

![A muted trailer preview over Mira's poster shelves](docs/assets/video-preview.jpg)

### Make it yours

Choose an accent color, change the app icon, or adjust the browsing layout. The silver icon and dark surfaces carry through the app. On iPhone and Mac, the Home logo does a brief dance after ten stationary seconds and respects Reduce Motion.

![Mira appearance settings with accent colors and Movies or Videos browsing modes](docs/assets/appearance.jpg)

## What's new in build 155

- Mac navigation no longer captures the entire scrolling page for live blur.
- Poster filtering is lighter, and shelves do not replay entrance fades during browsing.
- Animated collection artwork loads on hover. Hover previews stop while scrolling, and opening a preview sheet suppresses the hover player.
- iPhone and Mac gain Videos mode and the idle logo dance.
- Fire TV gets the navigation rendering changes while retaining remote controls.

[Read the full changes and validation results](docs/BUILD-155.md).

## Updates

Mac and Fire TV check the release feed, download an update and require installation confirmation. The optional [Mira iPhone Updates helper for Mac](https://github.com/4marawan001/Mira/releases/latest/download/Mira-iPhone-Updates-macOS.zip) checks for a newer IPA and hands it to Sideloadly. iPhone signing refresh remains separate from installing new features.

The [update manifest](https://github.com/4marawan001/Mira/releases/latest/download/mira-updates.json) records each package's version, build, size and SHA-256 checksum. Build 155's public downloads were checked against those values.

## Testing status

These are personal testing builds. Build 155 passed 19 focused Mac checks, 102 iPhone regression checks and a TV remote navigation smoke test. Five broader desktop test failures remain unresolved. Physical iPhone and Insignia Fire TV performance still need testing; emulator timings do not establish smoothness on every device. Details are in the [validation notes](docs/BUILD-155.md#validation).

The Mac package supports Apple Silicon and is ad-hoc signed. The Fire TV package supports ARMv7 and ARM64 Android/Fire OS devices with Android 7 or later. Platform features differ; Videos mode and the logo dance are excluded from TV.

## Source and credits

Each release includes the exact Mira source snapshots, patches, recorded upstream commits, and original licenses and acknowledgements. This repository is the download and documentation hub; the source archives live under Releases.

Built on [Nuvio Mobile](https://github.com/NuvioMedia/NuvioMobile), [Nuvio Desktop](https://github.com/NuvioMedia/NuvioDesktop), [Nuvio TV](https://github.com/NuvioMedia/NuvioTV) and [nuvio-engine](https://github.com/NuvioMedia/nuvio-engine).

Mira is a personal fork and is not affiliated with Nuvio or Apple. Release assets exclude saved account data and private signing keys. Media artwork belongs to its respective owners.
