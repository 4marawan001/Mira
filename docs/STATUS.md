# Current status

[Documentation](README.md) · [Downloads](../README.md#download)

## Available now

| Platform | Published package | Verification |
| :--- | :--- | :--- |
| iPhone | **181 / 0.5.37** | Release IPA identity, architecture and archive checks; 20 focused Native tests; mini simulator playback path |
| Apple silicon Mac | **181 / 0.5.37** | Release package, signature, native libraries and JVM checked; installed app reached Home |
| Intel Mac | **181 / 0.5.37** | Release package, architecture and JVM checked under Rosetta; physical Intel playback pending |
| Fire TV | **180 / 0.5.36** | Signed Release packages; 116 focused checks; user-confirmed external Arabic/English playback and restart checks |

The owner is testing the iPhone release. Mac dialogue testing was deferred. Simulator observations, automated checks and listener-confirmed device tests are recorded separately. No claim is made that every provider, movie cut or device is fully tested.

[181 release report](BUILD-181.md) · [180 release report](BUILD-180.md)

## October 16 audit

The full Mac suite initially ran 1,654 tests with five failures. Investigation found stale expectations for the bounded search error state, static poster fallback, minimum real-content duration and idle hero behavior. Those expectations were updated to match the current policies. Four new checks cover manual subtitle acquisition, Arabic text, cancellation, stale results and failed files. The resulting full run passed 1,658 tests with no failures or skips; a second full run after the final manual-calibration guard also passed.

Further source changes for build 182 improve the manual subtitle timing path: cancel obsolete downloads, avoid sending video authorization headers to subtitle providers, parse off the UI thread and reuse already-corrected cue times. The iPhone no-provider startup state now offers Retry instead of keeping a loading indicator active. A manual calibration action cancels any automatic match still running. Build 182 is development work; the download links above remain on the verified published builds until preview review and packaging are complete.

The first full iOS Native run covered 1,481 tests with four failures: two stale hero-layout expectations and two pending-provider loading expectations. The hero tests now follow the current compact design; iPhone pending-provider handling was corrected to match the bounded Mac state. The corrected full iOS Native run passed all 1,481 tests with no failures or skips. Debug preview 182 built successfully and is running on the dedicated iPhone 12 mini simulator. Home, Search and View All were checked visually in upright portrait. Final Release IPA packaging awaits preview feedback.

The full Fire TV suite ran 2,177 checks: 2,174 passed, two failed, and one live-network check was skipped. The failures are in bundled Media3 runtime tests: localhost HTTP error classification and late allocation release/trim behavior. They remain open; the app-specific checks are not substituted for a full-suite pass. The skipped check requires a real private debrid stream URL and is not run by a public unit suite.

The existing update-helper suite passed all 26 feed/checksum checks. The public shared-channel audit also passed, including the downloaded IPA's internal identity and version. All 30 documentation pages and 91 relative links/images passed the offline link check.

## Remaining limits

- Automatic subtitle matching needs a usable embedded timeline and a sufficiently compatible external file. It does not transcribe speech. Unsupported containers, different cuts and ambiguous matches retain original timing/manual adjustment.
- iPhone and Mac 181 use bounded Matroska indexing and conservative unedited MP4 text sample tables. Edited or fragmented MP4, HLS and live sources are not covered by that automatic index reader.
- Hardware-aware quality uses source metadata, not a connection-speed or picture-quality measurement. Actual playback validates the selected source.
- Mac packages are ad-hoc signed and not Apple-notarized. iPhone installation still requires signing through Sideloadly.
- Sustained scrolling/frame pacing and all providers need device testing. Fire OS performance outside Mira is outside the app's control.

## Reporting a problem

Include platform, build number, device model, action and error text. For subtitles, include the provider name and whether captions are early, late or drifting. Do not post passwords, private add-on URLs, API keys or unredacted logs. A public provider name is enough to begin the investigation.

Older reports are in the [documentation index](README.md). Their package versions and outstanding checks describe those historical builds, not the current release table.
