# Mira Fire TV 176 (`v0.5.32`) · Automatic subtitle sync reliability

This update addresses Codex review findings from Build 175 to improve background subtitle prefetch ownership, candidate download timeouts, privacy logging, and live-reference handling:

- **Isolated prefetch ownership**: Embedded subtitle timeline prefetching (`embeddedSubtitleTimelinePrefetchJob` and `prefetchSourceUrl`) is now scoped per `PlayerRuntimeController` instance. Selecting or re-selecting a subtitle language on the same video stream no longer cancels an ongoing HTTP range index probe, allowing language switching to seamlessly benefit from in-flight prefetching. Prefetch is cleanly cancelled when opening a different stream or exiting playback.
- **Strict 20-second selection deadline**: Individual candidate subtitle downloads are now dynamically clipped to the remaining total search budget (`min(5s, remainingBudget)`). No new candidate download will start once the 20-second budget has elapsed, preventing cumulative timeout stalls.
- **Production privacy logging**: Centralized all `SUB_PICK`, `AUTO_SYNC_PREFETCH`, and `AUTO_SYNC_V2` logs into `AutoSyncDiagnostics`. Full stream URLs, external subtitle URLs, query parameters, auth tokens, passwords, and userinfo are stripped before output. Exception logging captures simple class names rather than sensitive message strings.
- **Live-reference fallback & monotonic clocking**: Removed the invalid wall-clock versus media-span ratio check that caused premature aborts in `awaitNearCompleteLiveReferences`. Bounded live-reference polling by `min(LIVE_REFERENCE_WAIT_MS, candidateSearchBudgetMs)` and switched elapsed-time tracking to `System.nanoTime() / 1_000_000L` so demuxer references arriving after 200ms–800ms are correctly evaluated.
- **Authentic cross-language regression verification**: Validated against authentic multi-language regression fixtures (passes on 175/176, fails on 173) without artificial penalty hacks.

## Test and Validation Evidence

- **202 selected tests passed**: The filtered `AutoSync`, `Subtitle`, and `StreamAutoPlay` test suites completed with 202 passed and 0 failures.
- **Independent Codex verification**: Codex independently reran 38 retimer and diagnostic tests in an isolated JUnit harness; all 38 passed.
- **Physical Insignia subtitle timing and sustained performance remain unverified**: Automated harness and JVM unit tests do not guarantee that every subtitle provider, cut, or format synchronizes perfectly on physical hardware. Physical Fire TV / Insignia validation remains separate.

## Artifacts and Installation

Install the new Fire TV APK over your existing Mira app to receive this update; all existing account data, add-ons, settings, and watch progress are preserved.

- **Universal APK** (All ABIs): `Mira-FireTV-universal.apk` (SHA-256: `985a806b85fb74650b4b2ef70128d751b303c1fcfce892235a31051878248839`)
- **ARMv7 APK** (32-bit): `Mira-FireTV-armv7.apk` (SHA-256: `29e20a9ce373d03a0b70f6b32c65ade6164242cea2af5f7aec3a56a530ae6e76`)
- **ARM64 APK** (64-bit): `Mira-FireTV-arm64.apk` (SHA-256: `c0659228b07f11f7b5833106ac41222bb4a65d9d9819c8a0f07abb5d171d39d7`)
- Package: `app.mira.tv`
- Version: `0.5.32` (`versionCode = 176`)
- Signing Certificate: Verified against existing `MiraPersonal` key (`9ee1ac4c7d4b305cba2fa2defd10dd7a330cb9ff48097f580e17953fe2974bba`)
