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
<p align="center"><a href="#download">Download</a> · <a href="#inside-mira">Explore</a> · <a href="docs/INSTALL.md">Install</a> · <a href="docs/BUILD-181.md">Latest checks</a> · <a href="docs/RELEASING.md">Build & publish</a></p>

![Mira Home on Mac](docs/assets/home.jpg)

*Real Mac screenshot from build 155. Catalog artwork depends on your sources; the current Mac uses static poster hover cards.*

## Download

| Device | Release package | Version | Setup |
| --- | --- | --- | --- |
| iPhone | [IPA](https://github.com/4marawan001/Mira/releases/download/v0.5.37/Mira.ipa) | 0.5.37 / 181 | Sign with Sideloadly; iOS 16.1+. |
| Apple Silicon Mac | [ARM64 DMG](https://github.com/4marawan001/Mira/releases/download/v0.5.37/Mira-macOS-arm64.dmg) | 0.5.37 / 181 | macOS 12+. |
| Intel Mac | [Intel DMG](https://github.com/4marawan001/Mira/releases/download/v0.5.37/Mira-macOS-x86_64.dmg) | 0.5.37 / 181 | macOS 12+. |
| Fire TV | [Universal APK](https://github.com/4marawan001/Mira/releases/download/v0.5.36/Mira-FireTV-universal.apk) | 0.5.36 / 180 | Android-based Fire TV, API 24+. |
| iPhone update helper for Mac | [Universal Mac ZIP](https://github.com/4marawan001/Mira/releases/download/v0.5.22/Mira-iPhone-Updates-1.1.1-macOS.zip) | Helper 1.1.1 / 169 | Apple Silicon or Intel; macOS 13+. |

Keep Mira installed when updating, and use the same signing identity to retain local data. Mac packages are ad-hoc signed, without Apple notarization. [Installation guide](docs/INSTALL.md) · [All releases](https://github.com/4marawan001/Mira/releases).

**iPhone and Mac 181 add automatic external subtitle timing.** Mira validates an add-on file against a usable embedded subtitle timeline, writes a corrected local SRT, and cancels obsolete work when you change tracks. The menu keeps its existing appearance. Both targets passed 20 focused checks. The iPhone simulator generated and attached a corrected Arabic file; physical iPhone and Mac dialogue checks remain for the owner. [Changes and checks](docs/BUILD-181.md).

GitHub’s “Latest” points to the shared Fire TV release, which carries the update manifest for every platform. Platform versions can differ; use the table for downloads.

## Inside Mira

Mira is a personal fork of the open-source Nuvio apps. Cinematic artwork, near-black surfaces and compact poster shelves carry through Home, Search, Saved and details. Profiles stay tucked in Settings; PIN-protected profiles still require unlocking. Genre shortcuts and IMDb Top 250 entry points are available from Home.

Search displays results as add-ons respond. View All keeps the original query and loads later pages on demand. Duplicate detection and repeated-page protection prevent endless repeated results. There is no fixed total-result cap; providers can still omit matches or lack search/pagination support. Person profiles and cast navigation depend on metadata returned by your sources.

<p align="center"><img src="docs/assets/iphone-168-preview.png" width="330" alt="Mira 168 Home on the iPhone 12 mini simulator" /></p>

*iPhone 168 on the dedicated Debug iPhone 12 mini simulator. The reviewed source is now packaged in the separate Release IPA.*

### Choose playback quality

| Mode | iPhone | Mac | Fire TV |
| --- | --- | --- | --- |
| Low Data | Prefers smaller 720p. | Prefers smaller 1080p. | Prefers smaller 1080p. |
| Balanced | Prefers good 1080p, considering size and codec support. | Prefers compatible 4K within the size budget. | Prefers supported 4K on a capable 4K TV; otherwise 1080p. |
| Highest | Prioritizes hardware compatibility, resolution and disc sources. | Prioritizes compatible resolution and disc/REMUX. | Prioritizes supported resolution and disc/REMUX. |

Mac and TV Balanced use a budget of **40 decimal GB per two hours**, scaled by known runtime. Balanced now considers runtime-scaled compression hints, so a tiny 2 GB two-hour 4K copy no longer wins just for saving space. A substantial encode is preferred when available; short episodes scale down. Unknown-size or oversized copies remain available manually. Hardware checks help rank supplied codec metadata; they do not measure bandwidth or guarantee every HDR mode, codec profile, audio format or container. Playback still validates the real stream when opening it.

### iPhone previews

Select **Settings → Look & feel → Browsing → Videos**, then press and hold a poster. A supplied trailer is preferred. A ready direct stream can provide a muted excerpt from **0:20 to 0:50**, ending earlier for short videos. Videos shorter than 20 seconds start at zero. Unknown duration or unsupported seeking shows an unavailable message. Normal playback and watch progress stay separate from previews.

Mac build 165 removes Videos mode and automatic hover-video playback to reduce decoder work while browsing. Static hover cards remain. TV has no hover-video mode.

### Appearance

Choose an accent color, alternate icon and layout. The default uses Mira’s silver mark and dark surfaces. On iPhone and Mac, the Home logo briefly dances after ten stationary seconds and respects Reduce Motion. TV uses remote focus indicators.

## Fire TV, adapted for your remote

![Mira Fire TV Home](docs/assets/firetv-167-home.png)

<table><tr>
<td width="50%"><img src="docs/assets/firetv-170-quality.png" alt="Fire TV automatic quality picker" /></td>
<td width="50%"><img src="docs/assets/firetv-167-posters.png" alt="Fire TV poster browsing" /></td>
</tr></table>

*Home/poster images are build 167; the quality picker is build 170, all in an Android TV emulator. Populated browsing uses a local metadata-only fixture with public Cinemeta artwork. These images do not establish physical-TV performance.*

Build 167 introduced bounded poster decoding, removed duplicate catalog presentation work and avoided live source-menu blur. Focus scrolls when a card needs room. Empty Home retains navigation and setup. Provider responses are serialized to prevent competing autoplay selections. Build 170 raises the Balanced ceiling to 40 GB/two hours, reduces the preference for over-compressed copies, and prevents cached links or early binge groups from bypassing current quality selection. [TV changes and validation](docs/BUILD-167.md).

## Lighter Arabic and English subtitles

On Fire TV 180, choose **Arabic** or **English** for automatic selection. Mira prefers a matching full-dialogue embedded track, then considers add-on release names, filenames, frame rate and reported hash matches. It gives other providers a place before repeated files from one provider. OpenSubtitles remains eligible even with numeric IDs.

A compact side panel separates languages, exact file choices, and appearance/timing. The active language shows its provider; the file list opens at the checked track. The checkmark means **currently selected**, not “provider examined.” Choosing an individual file keeps that choice.

<p align="center"><img src="docs/assets/firetv-172-subtitles.png" width="800" alt="Mira Fire TV compact subtitle language panel" /></p>

*Final signed 172 APK, with synthetic media on a two-core, 1 GB Android TV emulator. This demonstrates selection and rendering, not guaranteed smoothness or real-film synchronization on every TV.*

Subtitle analysis runs off the UI thread, one worker at a time, with a bounded candidate pool and deadline. Container indexing starts on demand, bitmap packets bypass text analysis, and video buffers leave heap room for captions/UI. The sidecar path preserves the video buffer, cancellation guards and original cue timing.

**Fire TV 180 completed live Arabic and English checks on an Insignia TV.** Repeated provider ranking and speculative preparation used to exhaust the correction deadline before a match finished. Mira now reuses unchanged rankings, prioritizes a ready file, and retains a validated correction if later work times out. Restored subtitles run correction again; obsolete selections are cancelled. The owner confirmed Backrooms dialogue in sync, including fresh selections after reopening, and reported success on two more movies. Cold analysis took about 12–16 seconds; warm Arabic analysis took about four seconds. **116 focused checks passed.** Sustained performance, other source cuts and later-film drift still need testing. [Changes and validation](docs/BUILD-180.md).

## Automatic timing on iPhone and Mac

Build 181 ports the Fire TV 180 alignment algorithm to iPhone and Mac, including external subtitle startup, restored choices and manually selected files. It prefetches a bounded container subtitle index, performs matching on one background worker, and passes a corrected UTF-8 SRT to the existing player. Current manual delay resets for that corrected file so an old offset is not applied twice; saved preferences are retained.

Automatic timing needs a reliable embedded reference. Matroska indexes and conservative unedited MP4 text tracks are supported; HLS/live sources, fragmented or edited MP4 files and unavailable or ambiguous references retain original timing and manual adjustment. This compares subtitle timelines rather than listening to dialogue. It cannot guarantee synchronization for every file or a different movie cut.

The Apple Silicon app reached Home with existing data after updating. Both Mac architectures passed signature, native-file and packaged-JVM checks; Intel physical playback remains untested. The iPhone Release IPA requires signing with Sideloadly. [Release downloads](https://github.com/4marawan001/Mira/releases/tag/v0.5.37) · [Source and checks](docs/BUILD-181.md).

## Previous quality update

Mac 169 and Fire TV 170 improve Balanced selection while preserving iPhone 168. For a two-hour movie, an 18 GB 4K Blu-ray HEVC encode beats a 2 GB 4K copy; a 39 GB REMUX does not win automatically. The maximum is 40 GB, rather than a target download size.

The new focused checks passed **68 Mac tests and 45 TV tests**, plus a signed TV Release quality-settings remote check. The separate populated-browsing fixture check did not pass setup. [Mac checks](docs/BUILD-169.md) · [TV checks](docs/BUILD-170.md). Physical Insignia playback and sustained frame pacing still need device testing.

## Updates

Mac checks on opening and hourly while running, verifies downloads with SHA-256, then provides **Install & Restart**. Fire TV uses its existing update/install confirmation flow.

The optional Mac helper downloads a verified IPA and opens Sideloadly. Signing refresh and feature installation are separate; Sideloadly may still need you to click Start. The helper now recovers if a platform-only GitHub release temporarily becomes Latest without a manifest, checks cached IPA integrity and internal app version, and prevents downgrading an actually newer cached package.

![Mira iPhone Updates ready for Sideloadly](docs/assets/updater-ready.png)

*Helper 1.1.1, verified on this Mac. It downloads an IPA; it cannot bypass iPhone signing requirements.*

[Live update manifest](https://github.com/4marawan001/Mira/releases/latest/download/mira-updates.json) · [Publishing rules and channel check](docs/RELEASING.md).

## Checks and remaining device testing

The October 14 audit passed **118 iPhone logic checks, 53 Mac checks, 49 Fire TV checks and 26 helper checks**. This includes synthetic pagination beyond 1,000 results, hardware-aware quality ranking, profile cache isolation, update verification and temporary-app Mac installer tests. These are selected regression suites, not a claim that every device path is tested.

Earlier broad suites retain known failures: two vendored TV Media3 tests and five desktop tests recorded in previous reports. Physical Insignia playback/focus, Intel GUI behavior, real-provider iPhone seeking and sustained scrolling performance still need device checks. No measured 60fps or zero-lag claim is made. [Full audit status](docs/AUDIT-2026-10-14.md).

## Source and earlier changes

App source archives and patches are attached to their platform releases. The source repositories contain local changes beyond those archives; the audit and build documents identify the delivered versions. The update helper’s source and checks are in [companion](companion), with a read-only [release channel validator](tools/check-release-channel.py).

[iPhone & Mac 181](docs/BUILD-181.md) · [TV 180](docs/BUILD-180.md) · [TV 173](docs/BUILD-173.md) · [Mac 165](docs/BUILD-165.md) · [iPhone 164](docs/BUILD-164.md) · [TV 167](docs/BUILD-167.md) · [Earlier release history](https://github.com/4marawan001/Mira/releases).

Mira builds on [NuvioMobile](https://github.com/NuvioMedia/NuvioMobile), [NuvioDesktop](https://github.com/NuvioMedia/NuvioDesktop) and [NuvioTV](https://github.com/NuvioMedia/NuvioTV). App source archives retain their upstream licensing and notices. Catalog availability depends on the add-ons you configure; Mira does not host media.
