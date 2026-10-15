# Fire TV 176 (`v0.5.32`) · Automatic Subtitle Sync Reliability

Release **0.5.32 / build 176** addresses Codex review findings following Build 175, focusing on background subtitle prefetch ownership, candidate download budget enforcement, production privacy logging, and delayed demuxer reference handling.

## Key Fixes in Build 176

1. **Scoped Prefetch Ownership in Player Runtime**:
   - `PlayerRuntimeController` now scopes embedded subtitle timeline prefetching (`embeddedSubtitleTimelinePrefetchJob` and `prefetchSourceUrl`) per controller instance.
   - Re-selecting or switching a subtitle language on the same active video stream no longer cancels an in-flight HTTP range index probe.
   - The prefetch job and HTTP connection are cleanly cancelled whenever a different stream URL is loaded or playback exits.

2. **Strict 20-Second Candidate Download Deadline**:
   - Subtitle candidate downloads dynamically clamp their timeout to the remaining global search budget via `BestSubtitleCandidateSearch.computeCandidateDownloadTimeoutMs()`.
   - Downloads are budgeted with `min(5000ms, remainingBudgetMs)`, and no new candidate download starts once the 20-second budget has elapsed.
   - This eliminates cumulative timeout stalls when multiple slow subtitle providers respond concurrently.

3. **Production Privacy and Diagnostic Logging**:
   - Centralized all `SUB_PICK`, `AUTO_SYNC_PREFETCH`, and `AUTO_SYNC_V2` event formatting into `AutoSyncDiagnostics`.
   - Strips full video stream URLs, external subtitle candidate URLs, query parameters, credentials, and userinfo before emitting log messages.
   - Replaces detailed exception messages with simple class names to prevent token leakage in crash or diagnostic traces.

4. **Live-Reference Demuxer Fallback and Monotonic Timing**:
   - Removed the invalid wall-clock versus media-span ratio check that caused premature aborts in `awaitNearCompleteLiveReferences`.
   - Bounded live-reference polling by `min(LIVE_REFERENCE_WAIT_MS, candidateSearchBudgetMs)`.
   - Replaced non-monotonic clocking with `System.nanoTime() / 1_000_000L` so demuxer references arriving after 200ms–800ms are correctly evaluated.

5. **Multi-Language Regression Testing**:
   - Replaced artificial Arabic test penalties with authentic multi-language regression test fixtures that fail under Build 173's implementation and pass cleanly under Build 176.

## Verification and Test Results

- **202 selected tests passed**: The filtered test suites (`AutoSync`, `Subtitle`, `StreamAutoPlay`, and `PlayerRuntimeController`) completed with 202 passed, 0 failures, 0 errors, and 0 skipped.
- **Codex independently reran 38 retimer/diagnostic tests**: Codex executed the 38 retimer, live reference, and privacy diagnostic tests in an isolated JUnit test harness; all 38 tests passed.
- **Physical Insignia subtitle timing and sustained performance remain unverified**: Automated unit and regression tests do not guarantee that every subtitle provider, format, or cut synchronizes without manual adjustment. No physical television testing was performed for this build. Do not claim every subtitle is fixed or that physical testing occurred.

## Artifacts and Installation

Install the updated APK directly over your existing Mira Fire TV installation. All existing settings, profiles, add-ons, and watch history are preserved.

- **Universal APK** (All architectures): [Mira-FireTV-universal.apk](https://github.com/4marawan001/Mira/releases/download/v0.5.32/Mira-FireTV-universal.apk) (134,512,467 bytes)
  - SHA-256: `985a806b85fb74650b4b2ef70128d751b303c1fcfce892235a31051878248839`
- **ARM64 APK** (64-bit): [Mira-FireTV-arm64.apk](https://github.com/4marawan001/Mira/releases/download/v0.5.32/Mira-FireTV-arm64.apk) (54,004,593 bytes)
  - SHA-256: `c0659228b07f11f7b5833106ac41222bb4a65d9d9819c8a0f07abb5d171d39d7`
- **ARMv7 APK** (32-bit): [Mira-FireTV-armv7.apk](https://github.com/4marawan001/Mira/releases/download/v0.5.32/Mira-FireTV-armv7.apk) (52,015,635 bytes)
  - SHA-256: `29e20a9ce373d03a0b70f6b32c65ade6164242cea2af5f7aec3a56a530ae6e76`

Package name: `app.mira.tv`  
Version code: `176`  
Version name: `0.5.32`  
Certificate SHA-256: `9ee1ac4c7d4b305cba2fa2defd10dd7a330cb9ff48097f580e17953fe2974bba`  

[Release v0.5.32](https://github.com/4marawan001/Mira/releases/tag/v0.5.32) · [Previous timing fixes](BUILD-173.md) · [Releasing documentation](RELEASING.md)
