# More reliable subtitle controls and search

Build 182 / 0.5.38 updates iPhone and Mac. Manual subtitle timing now uses the cues actually attached to playback, including an automatic correction already applied. Starting a manual calibration stops any pending automatic match so it cannot undo your adjustment. Changing the subtitle or source cancels obsolete cue downloads and rejects late results.

Manual cue acquisition uses the existing bounded downloader, parses off the UI thread and keeps video authorization headers away from subtitle providers. Failed files settle into an error instead of leaving the manual tool loading. On iPhone, search offers Retry when sources have not connected rather than showing an indefinite spinner.

The full automated suites passed: **1,658 Mac tests, 1,481 iOS Native tests and 26 update-helper checks**. The reviewed iPhone mini preview was checked on Home, Search and View All before Release packaging. Profile PINs, person lookup, add-ons, saved data and the existing design are retained.

This release contains `Mira.ipa` for Sideloadly and separate Apple Silicon and Intel Mac DMGs. Mac requires macOS 12 or newer; packages are ad-hoc signed and not notarized. iPhone installation requires signing. Physical iPhone dialogue testing and physical Intel playback remain pending.

Fire TV remains on **180 / 0.5.36**. Its full audit found two open bundled Media3 runtime test failures and one skipped private-stream test; these have not been presented as fixed. This release does not change Fire OS services. Smoothness still needs sustained device testing.

Automatic subtitle correction matches an embedded timeline; it does not listen to speech. A usable reference and compatible movie cut are required. Unsupported or ambiguous sources retain original timing and manual adjustment. See `VALIDATION.md` for the detailed checks and limitations.

---

## Verification report

## Automated checks

- Mac: 1,658 tests, zero failures/errors/skips. The complete suite passed again after the final manual-calibration guard.
- iOS Native arm64 simulator: 1,481 tests, zero failures/errors/skips.
- Update helpers: 26 checks, zero failures.
- New manual acquisition coverage: no video headers sent to providers, Arabic text preserved, changed-source results rejected, cancellation without a false error, and unavailable-file completion.
- Existing automatic correction tests now check that attached corrected cues survive selection cancellation and clear when the session closes.
- Stale test expectations were corrected for current idle hero behavior, compact iPhone hero layout, static poster fallback, bounded pending-provider search and realistic watch-progress duration. These were test policy corrections; the hero design was not changed.

## Preview

Debug 182 built and ran on the dedicated iPhone 12 mini simulator. Home, Search and View All were checked visually in upright portrait; search settled its provider results. The owner reviewed the preview and explicitly approved final IPA packaging. Person lookup and PIN/profile paths were retained. Simulator app data was not copied to the physical phone.

## Final packages

The Release IPA must pass ZIP integrity, internal bundle identity/version and arm64 app/widget/framework verification before publication. Mac DMGs must pass signature, native architecture, packaged JVM startup and disk-image integrity checks. `PACKAGE-VALIDATION.json` records the completed checks, sizes and hashes for this release. The IPA is unsigned for Sideloadly; Mac packages are ad-hoc signed, not Apple-notarized. Minimum versions are iOS 16.1 and macOS 12.

Sideloadly completed the owner’s iPhone update, and a read-only device inventory verified that the existing Mira identity changed from build 143 to 182. The Mac app was updated to 182, preserving the previous app bundle and app data; it reached Home with Home/Search/Saved, genre controls and IMDb Top 250. Physical iPhone 182 subtitle/dialogue testing and physical Intel playback remain pending. No new sustained frame-time benchmark is claimed. The shared updater preserves Fire TV 180 as Latest and updates only the iPhone/Mac entries to 182.

## Fire TV audit remains open

The unchanged TV source ran 2,177 tests: 2,174 passed, two failed and one skipped. Failures are `LocalhostZeroCopyDataSourceTest.testHttpError404` (bundled HTTP exception/status behavior) and `DefaultAllocatorTest.testLateReleasedAllocationsMemoryLeak` (late allocation trim behavior). The runtime is vendored as prebuilt Media3 libraries; neither failure was hidden by weakening tests. The skipped frame-rate test requires a private live debrid URL. These findings do not establish the cause of every TV slowdown.

## Timing limits

Automatic correction uses an embedded subtitle timeline, not speech recognition. It needs a sufficiently compatible external file and range-capable source. Matroska subtitle indexes and conservative unedited MP4 text tables are supported; edited/fragmented MP4, HLS, live sources, absent references, different cuts and ambiguous matches retain original timing/manual adjustment. Original captions can appear while a correction is prepared. Manual correction now cancels pending automatic work.

Account data, private provider URLs, signing keys, raw logs and private device telemetry are excluded from this public report and source archives.

## Installation confirmation

The iPhone was still running build 143 when the owner reported the old four-tab interface. Sideloadly completed the update to 182, a device inventory verified that it replaced the existing Mira identity, and the owner confirmed the redesigned interface is back. The Mac app was also updated to 182 and reached the custom Home screen. Previous app bundles are backed up locally. Subtitle/dialogue tests for this new iPhone build remain pending.
