# Using Mira

[Documentation](README.md) · [Install](INSTALL.md) · [Current status](STATUS.md)

## Home and search

Mira opens in Home. Home, Search and Saved are the main tabs; profile switching and PIN-protected profiles are in Settings. Home includes genre shortcuts and IMDb Top 250 entry points. Catalog content and person/cast information depend on your enabled sources.

Search shows results as each source responds. Slow or failed sources do not hold back successful results. View All keeps the same query and requests later pages as you scroll. Duplicate items and endlessly repeated pages are filtered; there is no fixed total-result cap. A provider can still omit matches or lack search and pagination support. Retry retains results that already loaded.

## Playback quality

Choose a mode in playback settings. Mira ranks available links from your enabled sources using device capabilities and the metadata those sources supply.

| Mode | iPhone | iPad | Mac | Fire TV |
| :--- | :--- | :--- | :--- | :--- |
| Low Data | Prefers smaller 720p | Prefers smaller 720p | Prefers smaller 1080p | Prefers smaller 1080p |
| Balanced | Targets good 1080p | Targets compatible 4K / 2160p | Prefers compatible 4K | Prefers compatible 4K on a capable 4K TV, otherwise 1080p |
| Highest | Prioritizes compatible resolution and disc sources | Prioritizes compatible resolution and disc sources | Prioritizes compatible resolution and disc/REMUX | Prioritizes compatible resolution and disc/REMUX |

Mac and TV Balanced use a ceiling of 40 decimal GB per two hours, scaled by known runtime. A substantial encode can rank above a heavily compressed copy; the ceiling is not a target download size. For example, an 18 GB two-hour 4K Blu-ray HEVC encode can beat a 2 GB 4K copy. A 39 GB REMUX does not win automatically. Unknown-size and oversized files remain available manually.

On iPad, including M1 iPad Air, Balanced already targets 2160p in build 182. Hardware-compatible HEVC/H.264 copies are favored over a codec that needs software decoding. The iPad still uses the mobile size penalties; the Mac/TV 40 GB policy is separate. On M1 iPad Air, 4K sources are scaled to its 2360 × 1640 display. [Apple specifications](https://support.apple.com/en-us/111887).

On iPhone 12 mini, Balanced favors 1080p Blu-ray encodes when suitable copies are available. Codec and source readiness also affect the ranking. Highest can select much larger disc/remux copies. Metadata checks do not measure your connection speed or inspect picture quality; playback still validates the actual source when opening it.

## Subtitles

Choose a language or an exact file. Built-in full-dialogue tracks are preferred when suitable. On TV, add-on selection also considers release names, filenames, reported frame rate and hash matches. OpenSubtitles remains eligible even when it returns numeric IDs. A checkmark identifies the active file.

Automatic timing compares an external subtitle file with a usable embedded subtitle timeline. It does not listen to dialogue. iPhone and Mac 182 write a validated correction to a temporary UTF-8 SRT for the existing player; TV 180 uses its own playback integration. Switching sources or subtitles cancels obsolete matching work. Original captions can appear while analysis runs.

A different movie cut, missing reference, unsupported container or ambiguous match can still need another subtitle file or manual delay. The iPhone/Mac index reader supports Matroska and conservative unedited MP4 text tracks; live/HLS, fragmented MP4 and edited MP4 timelines retain original timing. See [build 182](BUILD-182.md) and [build 180](BUILD-180.md) for the exact checks and limits.

The manual Delay control remains available. After automatic correction, +0.000s can be normal because the file's timestamps were already rewritten.

## Appearance and previews

Use Settings → Look & feel to choose an accent, alternate icon and layout. The default uses Mira's silver mark and dark surfaces. On iPhone and Mac, the Home logo briefly dances after ten stationary seconds and respects Reduce Motion.

On iPhone, select Browsing → Videos and press and hold a poster. A supplied trailer is preferred. A playable direct source can provide a muted excerpt from 0:20 to 0:50, ending earlier for shorter videos. Videos shorter than 20 seconds start at zero. Unknown duration or unsupported seeking displays an unavailable message. Preview playback is separate from normal watch progress.

Mac uses static hover cards and has no automatic hover-video mode. Fire TV uses D-pad focus and has no hover-video mode. These differences limit unnecessary decoder work while browsing.

## Updates

Mac checks on opening and hourly while running, verifies the download and offers Install & Restart. TV uses its install confirmation flow. The iPhone/iPad helper 1.2.0 runs on Mac and downloads a verified universal IPA automatically. An optional setting opens each new verified build in Sideloadly once. Install it separately on each device with the same signing identity and AutoRefresh enabled; signing refresh then renews that installed version. [Setup and installation steps](INSTALL.md#automatic-updates-for-iphone-and-ipad).

The shared GitHub update feed contains independent versions for all platforms. GitHub Latest stays on the current TV release for compatibility with older TV apps. Use the [download table](../README.md#download) to choose your package.

