# Fire TV 173 · Subtitle sync deadline repair

Release **0.5.29 / build 173** repairs a reproduced regression in the previous TV build. Mira could calculate a confident timing correction, continue waiting for alternative subtitle providers, and then lose that result when its 20-second outer deadline expired. The provider-search phase now ends within six seconds, cancels unfinished jobs, and returns the best match that passed the existing confidence gates. It does not lower those gates or invent a correction without a reference.

## Evidence from the real movie

The authorized test account was used to play Backrooms with its existing providers. The active release was a 1080p Blu-ray with an embedded English SRT timeline of 1,053 cues. Small HTTP range requests read the container metadata/index and seven text samples; the whole movie was not downloaded. No passwords, account tokens, private provider URLs, subtitle text or movie screenshots are included in the public reports.

Six exact English text matches, spread from 1:30 to 1:38:54, independently show that one external release needs approximately **+7.9 seconds**. Applying that offset leaves at most 107 ms error across those samples. Another selected English file needs an offset plus a small frame-rate scale; timing is computed for the current release rather than hard-coded for this movie.

Using the real video index and selected subtitle, the original pipeline found a correction but returned no result after 20,013 ms with two stalled alternatives. With the fix, the same diagnostic case returned the confident correction in 7,655 ms. This controlled pending-provider test uses the production matching/loader logic and local copies of downloaded subtitle bodies; it is distinct from Android rendering and physical-device testing.

## Checks

**188 selected JVM tests passed**, with zero failures, errors or skips. Coverage includes subtitle encodings/parsing, HTTP cancellation, reference/DP resource bounds, timeline alignment, sidecar routing, language/release ranking and hardware-aware stream quality. New tests exercise preserving a confident match while a provider stalls, cancelling pending work when the user changes selection, and leaving original timing unchanged when no reference exists.

A second real-playback regression was also found and fixed: choosing Arabic after a built-in English track could be mistaken for a duplicate startup callback, suppressing sync. Explicit language choices now always request a fresh analysis; automatic lifecycle callbacks remain deduplicated. Three isolated gate tests cover returning to the same language, disabled sync, and changing playback sessions/sources.

Selecting a language respects the Automatic subtitle sync setting. Added URL-free outcome, elapsed-time, offset and scale diagnostics so a provider mismatch and an analysis deadline can be distinguished.

Signed APK identity/certificate and all three ABI packages are verified. See the release's VALIDATION.md and machine-readable reports for the final Android runtime observations. The physical Insignia is not connected over ADB; final sound-to-caption timing on that TV still needs a device retest. A deliberately constrained 1 GB emulator experienced a system low-memory kill while playing real 1080p media; this is recorded separately and is not claimed fixed by the synchronization change.

Install the new APK over your existing Mira app. The shared update feed retains iPhone 168 and Mac 169 unchanged.

[Download Fire TV 173](https://github.com/4marawan001/Mira/releases/tag/v0.5.29) · [Previous subtitle menu and resource work](BUILD-172.md)

## Final signed Android observations

The installed ARM64 APK hash matches UI-SMOKE.json. Real Backrooms playback and built-in English selection were observed. A fresh Arabic request after built-in English ran analysis and applied an offset/scale correction in 2,838 ms; 1,016 retimed cues were committed through direct-index mapping and Arabic captions were visually confirmed. The same process remained alive and AndroidRuntime's crash buffer was empty during these observations.

**Remaining intermittent failures:** the cold-start attempt returned no confident match after 12,913 ms. The subsequent explicit Arabic request succeeded, but an additional later language-selection attempt produced no new sync events within the 30-second observation window. Its cause was not established. These observations do not establish that every selection succeeds; physical-TV testing and further diagnosis of intermittent failures remain necessary. This release repairs the two verified regressions and does not claim perfect synchronization for every attempt or source.
