# Fire TV 173 validation

## Reproduced and repaired

Two subtitle regressions were reproduced with Backrooms and the authorized test account:

1. The matcher found a confident correction, but waiting for slow alternatives exhausted the adapter's 20-second deadline and discarded that correction. The provider search now finishes within six seconds, cancels unfinished jobs, and returns the best result that passed the unchanged confidence gates.
2. Arabic → built-in English → Arabic could suppress the second Arabic analysis because the startup deduplication key was unchanged. Explicit language selections now request fresh analysis; repeated automatic startup callbacks remain deduplicated. Disabled automatic sync stays disabled.

## Automated checks

188 selected JVM tests passed, zero failures, errors or skips. These include subtitle parsing/encoding/HTTP bounds and cancellation, sidecar selection/routing, reference and DP resource bounds, alignment/abstention, language and release ranking, hardware-aware stream quality, a slow-provider deadline regression, cancellation of pending providers, reference-free abstention, repeated language selection, disabled sync, and new playback-session eligibility. UNIT-RESULTS.json lists suite counts.

All three signed APKs are checked for actual package identity app.mira.tv, version 0.5.29 / build 173, original MiraPersonal signing certificate, ABI contents and ZIP integrity. Source includes the existing Media3 runtimes, excludes private configuration/account/signing data, and has a checked/applied patch against the build-155 archive.

## Real-file evidence

REAL-FILE-ANALYSIS.json separates the controlled real-file JVM diagnostic from Android runtime observations. Six actual embedded English lines sampled across Backrooms independently support an approximately +7.9-second correction for one external release, leaving at most 107 ms residual at those samples. A different selected English file needs both an offset and a small frame-rate correction. The offset is inferred from the current video and is not hard-coded for this film.

The diagnostic before/after comparison uses the real movie index and selected external file, with two controlled stalled alternatives: before, no correction returned at 20,013 ms; after, a confident correction returned at 7,655 ms. Only small container/header/index/text-block ranges were read; the full movie was not downloaded. No account credentials, provider URLs, subtitle bodies or movie screenshots are included in the public artifacts.

Preliminary Android observations were made before the repeat-selection fix and are labeled with that APK's separate hash. They must not be confused with final UI-SMOKE.json, which must match the final signed ARM64 APK before publication.

## Device limitations

Runtime testing uses an API 31 Android TV ARM64 emulator with two CPU cores and 2 GB guest RAM. A deliberately constrained earlier 1 GB test experienced a system low-memory kill during real 1080p playback; the timing repair is not claimed to fix that kernel-level memory limit. The actual Insignia TV is not connected for ADB logs. Physical sound-to-caption timing, UHD/PGS decoder performance and long-session stability still need a TV retest. Automatic correction requires a usable timing reference and confident alignment, and cannot guarantee every provider's cut or translation.

Unrelated vendored failures from earlier broader investigations remain outside this selected suite: LocalhostZeroCopyDataSourceTest.testHttpError404 and DefaultAllocatorTest.testLateReleasedAllocationsMemoryLeak.

The shared update feed preserves iPhone 168 and Mac 169. Install over the existing TV app; do not uninstall Mira to update.

## Final signed Android observations

The installed ARM64 APK hash matches UI-SMOKE.json. Real Backrooms playback and built-in English selection were observed. A fresh Arabic request after built-in English ran analysis and applied an offset/scale correction in 2,838 ms; 1,016 retimed cues were committed through direct-index mapping and Arabic captions were visually confirmed. The same process remained alive and AndroidRuntime's crash buffer was empty during these observations.

**Remaining intermittent failures:** the cold-start attempt returned no confident match after 12,913 ms. The subsequent explicit Arabic request succeeded, but an additional later language-selection attempt produced no new sync events within the 30-second observation window. Its cause was not established. These observations do not establish that every selection succeeds; physical-TV testing and further diagnosis of intermittent failures remain necessary. This release repairs the two verified regressions and does not claim perfect synchronization for every attempt or source.
