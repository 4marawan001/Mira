# Current status

**October 25: [0.6.0 overhaul preview](https://github.com/4marawan001/Mira/releases/tag/v0.6.0-preview.1)** — TV 196, Mac 197, iPhone/iPad 194 and Android mobile 195. [Changes](OVERHAUL-PREVIEW.md), [installation](INSTALL-OVERHAUL-PREVIEW.md) and [validation](VALIDATION-OVERHAUL-PREVIEW.md) describe the new designs, checks and open limits. The earlier stable channel remains unchanged.



[Documentation](README.md) · [Downloads](../README.md#download)

## Available now

| Platform | Published package | Verification |
| :--- | :--- | :--- |
| iPhone | **182 / 0.5.38** | Reviewed mini preview; Release IPA identity, architecture and archive checks; 1,481 Native tests passed |
| iPad / M1 iPad Air | **182 / 0.5.38**, same universal IPA | iPad Air simulator setup, browsing, Search, Saved, rotation and local H.264 playback checked; Apple HLS sample failed with HTTP 400 playlist errors; physical iPad pending |
| Apple silicon Mac | **182 / 0.5.38** | Release signature, native libraries and packaged JVM checked; 1,658 desktop tests passed |
| Intel Mac | **182 / 0.5.38** | Release architecture and packaged JVM checked under Rosetta; physical Intel playback pending |
| Fire TV | **180 / 0.5.36** | Signed packages; previous user-confirmed Arabic/English dialogue and restart checks; two bundled runtime audit failures remain open |

[182 release report](BUILD-182.md) · [181 release report](BUILD-181.md) · [180 release report](BUILD-180.md)

## October 23 iPad and updater checks

Build 182 already targets 4K on iPad and 1080p on iPhone in Balanced. Two added regression cases verify compatible iPad 4K selection and avoiding software AV1 ahead of compatible HEVC. The focused catalog/source suite passed **120 tests**. This does not establish physical 4K playback performance.

The new Mac helper **1.2.0** supports both iPhone and iPad, validates universal IPA support, and can hand off each new verified build to Sideloadly automatically. It passed **36 feed/checksum/package/handoff checks** and builds for arm64 and x86_64. A feature update still needs Start in Sideloadly for each device; signing renewal is handled separately by Sideloadly. [Installation and automatic updates](INSTALL.md#automatic-updates-for-iphone-and-ipad).

[iPad simulator report](https://github.com/4marawan001/Mira/releases/download/v0.5.38/IPAD-VALIDATION.md) records the UI checks and open HLS result. The app IPA remains build 182; these changes add verification, helper software and documentation.

## October 16 audit and fixes

Build 182 cancels obsolete manual subtitle downloads, rejects results after a source/selection change, parses off the UI thread and avoids sending video authorization headers to subtitle providers. Manual calibration uses already-corrected cues and stops pending automatic work so it cannot overwrite the adjustment. iPhone search offers Retry when no provider is ready instead of keeping a spinner running.

The complete Mac suite passed **1,658 tests** with no failures, errors or skips, including a repeat after the final calibration guard. The complete iOS Native suite passed **1,481 tests** with no failures, errors or skips. Four new acquisition tests cover provider headers, Arabic text, cancellation, stale results and failed-file completion. The update helpers passed all **26 checks**. Earlier test expectations for current hero layout/idle behavior, static poster fallback and realistic watch-progress duration were corrected; no hero redesign was introduced in this audit.

The owner reviewed the iPhone mini preview and approved Release packaging. Home, Search and View All were checked in the simulator. Release packages were verified separately. The owner confirmed the redesigned iPhone interface after updating from build 143 to 182. The installed Mac 182 reached its custom Home screen. Physical iPhone 182 dialogue testing, sustained browsing performance and physical Intel playback remain pending; package and unit checks are not substitutes for those tests.

The full unchanged Fire TV suite ran **2,177 checks: 2,174 passed, two failed, one skipped**. Open failures are bundled Media3 localhost HTTP error classification and late allocation release/trim behavior. The skipped frame-rate check requires a private live stream. These are still open and are not described as fixed or as proof of the cause of all TV lag.

## Remaining limits

- Automatic subtitle matching requires a usable embedded timeline and a sufficiently compatible external file. It does not transcribe speech. Different movie cuts and ambiguous matches may need another subtitle file or manual adjustment.
- The portable index reader handles bounded Matroska and conservative unedited MP4 text tables. Edited/fragmented MP4, HLS, live sources and missing references are outside its coverage.
- Hardware-aware quality ranks provider metadata; it does not measure internet speed or inspect the actual picture.
- Mac packages are ad-hoc signed and not Apple-notarized. iPhone and iPad installation requires signing through Sideloadly.
- Fire OS performance outside Mira is outside the app's control. No unrelated background services are disabled by Mira.

## Reporting a problem

Include platform, build, device, action and error text. For subtitles, include the provider name and whether captions are early, late or drifting. Do not post passwords, private add-on URLs, API keys or unredacted logs.

Older reports in the [documentation index](README.md) describe their own builds and historical checks.

