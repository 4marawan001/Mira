# Fire TV 171 validation

## Checks that passed

- **202 focused JVM checks passed: 0 failures, 0 errors, 0 skips.** Includes 25 new checks across provider JSON mapping, Arabic/English release ranking, fractional frame rates, real HTTP cancellation/limits/fallback and sidecar lifecycle. Existing AutoSync alignment, confidence, reference-consistency, Arabic charset/parser, credential-scope, cue ordering and TV quality suites are included. SUBTITLE-VALIDATION.json lists each selected suite.
- New lifecycle tests exercise the production rendering/commit extensions with mocked Android views/controller state: rebinding repaints the active cue, unbound views do not consume the repaint signature, stale generations cannot commit, and applying the same retime twice does not compound drift.
- MockWebServer tests verify legacy Windows-1256 Arabic downloads, provider-owned authorization, stalled-body socket cancellation, bounded payloads including chunked bodies, and recovery after a failed provider response.
- Signed Release APKs are checked with aapt, apksigner and ZIP integrity. Universal, ARM64 and ARMv7 retain package app.mira.tv, version 0.5.27/build 171 and the existing MiraPersonal signing certificate. No private signing material is published.
- Full source archive excludes build caches, private local configuration, saved accounts and signing keys. The source patch is checked and applied against the retained build 155 source; modified source files are compared.

## Emulator and physical-device scope

A dedicated API 31 ARM64 Android TV emulator is used with guest data and a local test add-on. The video is generated locally: a 150-second plain H.264 clip, with synthetic Arabic and English SRT cues. There is no copyrighted film content, account login or private provider URL in the fixture. The test add-on includes an intentionally invalid Arabic file before a valid Arabic file.

The original signed 170 app was installed and configured with that fixture, then upgraded in place to 171. The test add-on and guest state were retained. Manual D-pad testing checks the language action, invalid-file fallback and on-screen Arabic rendering. The final package is reinstalled after the fractional-frame-rate refinement and tested again before publication. Final emulator observations are in UI-SMOKE.json, with screenshots.

This fixture has no embedded subtitle reference, so it checks downloading, selection, fallback and rendering rather than proving full-film retiming against a real reference. Offset/drift correction and abstention are exercised with synthetic timelines in the JVM suites. The physical Insignia TV and the reported Backrooms release/provider combination have not been tested.

Automatic correction needs a suitable embedded timing reference and a confident alignment. It keeps original timing when none can be established. MPV and libass paths that cannot use sidecar retiming report unsupported; embedded subtitles and manual controls remain available. No claim of exact sync for all cuts, speech-based alignment, zero lag, measured 60fps or universal format compatibility is made.

Earlier broad-suite vendored failures are not represented as fixed: LocalhostZeroCopyDataSourceTest.testHttpError404 and DefaultAllocatorTest.testLateReleasedAllocationsMemoryLeak. They are outside the selected subtitle/quality suite.

The shared channel preserves iPhone 168 and Mac 169, including the iPhone lookup. Install the APK over Mira rather than uninstalling to preserve local app data.
