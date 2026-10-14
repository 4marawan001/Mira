# Mira Fire TV 171 — Subtitle matching and stability

External Arabic and English subtitle selection now uses provider release metadata instead of opaque IDs alone. Choose a language in the subtitle panel to request the best available track; choosing a specific row retains that exact choice.

- Prefer a matching full-dialogue embedded subtitle, then rank add-on tracks by language, release, frame rate, stream association and provider-reported hash match.
- Distinguish fractional rates such as 23.976/29.97 from 24/30 fps, and recognize forced-only release labels.
- Validate up to three distinct add-on downloads, trying another when a track is empty, unavailable or unparseable. Keep the existing track during this search.
- Cancel actual subtitle network calls when changing selection or reaching a timeout; cap response size. Preserve provider-owned request headers and strip credentials on out-of-scope redirects.
- Reuse the renderer's subtitle download during sync analysis, avoiding a duplicate request and renderer restart. Repaint active cues when the subtitle view is recreated.
- Apply repeat synchronization to original cues so corrections do not compound. Ignore stale results after switching subtitle, stream or turning subtitles off. Reset the previous track's manual offset when explicitly changing track/language.
- Enable automatic synchronization by default for new preferences; selecting a language enables it. Existing explicit disabled preferences stay disabled until that action or a Settings change.

Automatic retiming is confidence-gated and needs a usable embedded subtitle timing reference in the selected video. It can correct offset/drift when the reference is suitable, but cannot guarantee exact sync for every movie cut or provider file. With no reliable match, it keeps the original timing and reports the limitation. MPV/libass paths that cannot use this sidecar retiming report unsupported; embedded tracks and manual selection remain available.

Install this signed Release APK over Mira without uninstalling. Package identity and signing certificate are preserved. The shared update channel keeps iPhone 168 and Mac 169 unchanged; the iPhone lookup is retained.

See VALIDATION.md for actual checks and remaining physical-TV tests. No private add-on URLs, account data or signing keys are included.

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

![Automatic Arabic subtitle selection in the TV emulator](assets/firetv-171-subtitles.png)

Synthetic subtitle fixture in the final signed 171 APK. The intentionally invalid candidate is skipped and the usable Arabic track selected. This is a rendering/selection check, not a real-film sync demonstration.
