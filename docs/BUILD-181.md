# Automatic subtitle timing on iPhone and Mac

Mira can now correct external Arabic and English subtitle timing on iPhone and Mac using the same alignment algorithm tested on Fire TV 180. It reads a bounded subtitle index from the selected video, validates the external file against that timeline, and attaches a corrected UTF-8 SRT through the existing player. Startup, restored selections and manual file choices all use this path. Changing the source, selecting another subtitle, turning subtitles off, or leaving playback cancels obsolete work.

The matcher runs on one background worker with download and analysis limits. It retains a validated result if later provider attempts time out and removes its temporary files when playback ends. A corrected file resets the current manual offset to prevent applying a delay twice; saved manual preferences remain available.

This is timeline matching, not speech recognition. It needs a usable embedded reference and range-capable source. Supported references include Matroska subtitle indexes and conservative, unedited MP4 text tracks. HLS, live streams, fragmented or edited MP4 files and missing or unreliable references retain original subtitles and manual timing adjustment. A provider's different movie cut can still require another file.

The downloads are Release builds: `Mira.ipa` for Sideloadly, and separate Apple Silicon and Intel Mac DMGs. Mac packages require macOS 12 or newer and are ad-hoc signed. They are not Apple-notarized. Keep the existing app identity when updating to preserve your data.

Fire TV 180 remains the current TV release. This release does not change Fire OS settings or stop unrelated apps. See VALIDATION.md for checks, device results and remaining limitations.

# Mira 181 validation

## Automated checks

- Mac: 20 focused tests across two suites, zero failures/errors/skips.
- iOS Native (arm64 simulator): the same 20 focused tests, zero failures/errors/skips.
- Coverage: full Matroska index acquisition without downloading video, response/range bounds, malformed-container fallback, translated Arabic constant-delay alignment, text preservation, Windows-1256 Arabic decoding, ASS override parsing, no-reference fallback, cancellation during provider acquisition and file writing, corrected-file delivery and cleanup, and existing subtitle-selection rules.
- These are targeted regression checks, not new full-suite passes. The portable MP4 parser has conservative rejection rules; real edited/fragmented MP4 timing is unsupported.
- iPhone and Mac share identical common matcher, index-loading, acquisition and session-lifecycle code. Platform-specific charset and temporary-file implementations are compiled and exercised on their respective targets.

## Runtime observations

The iPhone 12 mini Debug 181 preview built successfully and retained the existing simulator profile/add-ons. Home, Search, details and subtitle controls were inspected. During actual Backrooms playback, external Arabic produced and attached a UTF-8 SRT with all 935 cues. This establishes a correction reached the player; it does not replace a listener's confirmation against dialogue. Physical iPhone testing remains separate.

Both Mac DMGs passed checksum, internal version, ad-hoc signature and native architecture checks. Packaged JVM startup succeeded for Apple Silicon and Intel (under Rosetta on the M1 host); 102 and 104 native files respectively matched their target architecture. The installed M1 app was updated from 169 to 181, launched and reached Home with existing Continue Watching entries. The user deferred Mac subtitle playback testing. Physical Intel Mac playback remains untested.

The TV 180 release was independently tested on the physical Insignia. The user confirmed external Arabic and English in sync, including fresh/restarted playback, and reported two other movies working well. No movie names/timings were recorded for those two additional user tests. Those TV results are not presented as physical iPhone or Intel Mac results.

## Timing limits

Matching uses an embedded subtitle reference, not speech recognition. The reference must describe the selected video's timing and the external file must be sufficiently compatible. Original captions can appear while correction is being prepared. Unsupported/missing indexes, servers without usable range support, different cuts, ambiguous matches and live/HLS sources retain original timing and manual adjustment. The portable MP4 path accepts unedited text sample tables and rejects edit lists, composition offsets and unsupported fragmented layouts. It does not scan all movie audio or download the complete video.

## Final Release packages

The iPhone Release build succeeded and its IPA passed ZIP integrity, internal app identity/version and native architecture verification. It contains Mira `com.nuvio.media`, version `0.5.37`, build `181`, minimum iOS `16.1`, with arm64 app, downloads widget and playback frameworks. It is unsigned for Sideloadly to sign. The verified IPA was loaded into Sideloadly for the owner; physical installation and dialogue testing are pending.

Mac Release DMGs contain `app.mira.desktop`, version `0.5.37`, build `181`, minimum macOS `12.0`, with separate Apple Silicon and Intel runtimes. They are ad-hoc signed and not Apple-notarized. PACKAGE-VALIDATION.json records package hashes, sizes and checks; SHA256SUMS.txt covers the release assets. The shared update channel keeps Fire TV 180 as Latest and updates only its iPhone/Mac entries to 181.

# Mira 181 source

`Mira-ios-source-181.zip` contains the iPhone source in `Mira-ios/`. `Mira-macOS-source-181.zip` contains the Mac source in `Mira-macOS/`, including the verified upstream Intel and Apple Silicon playback libraries. Both snapshots include the new subtitle matcher, container index reader, platform file handling, runtime integration and regression tests.

Installed account data, private signing keys, local configuration and build caches are excluded. Local builds can reuse `Mira-Handoff/env.sh`; see each archive's build documentation. Configure your own public account-service connection settings locally if rebuilding from an archive.

The accompanying patches apply to the respective source archives from build 155 / release v0.5.10. Each patch was applied to that base and every modified file compared with the complete snapshot. Restored upstream LFS playback binaries are present in the full Mac archive and normalized to their original pointers in the text patch.

Build 181 is 0.5.37 on iPhone and Mac. Fire TV remains on its independently tested build 180 / 0.5.36; its source is in that release. Source delta JSON files list the changed paths and upstream base commits.

[Release packages, source and checksums](https://github.com/4marawan001/Mira/releases/tag/v0.5.37) · [Fire TV 180](BUILD-180.md).
