# Mira Fire TV 173 · Keep verified subtitle sync

Fixed two reproduced subtitle regressions:

- Explicitly choosing Arabic again after built-in English now runs a fresh sync attempt. Startup deduplication previously suppressed the second Arabic request and left the newly loaded file uncorrected.
- A deadline regression: a valid English or Arabic subtitle correction could be found and then discarded while the app waited for slow alternative providers. The provider-search phase now ends within six seconds, cancels unfinished requests, and returns the best correction that passed the existing timing confidence checks.

Tested with the actual Backrooms Blu-ray and subtitle files from the authorized test account. Six English lines across the movie independently confirm the approximately +7.9-second correction for one release. The old stalled-provider case returned no correction after 20 seconds; the corrected pipeline returned a verified result in about eight seconds. These are reference-timeline checks, not a promise that every provider release can be synchronized.

Choosing a language also respects the Automatic subtitle sync setting instead of silently enabling it. Added diagnostics showing outcome, elapsed time, applied offset and scale without source URLs or account credentials.

Install the new Fire TV APK over the existing Mira app to receive this fix. The iPhone 168 and Mac 169 packages are unchanged. Physical Insignia testing remains separate.

## Final signed Android observations

The installed ARM64 APK hash matches UI-SMOKE.json. Real Backrooms playback and built-in English selection were observed. A fresh Arabic request after built-in English ran analysis and applied an offset/scale correction in 2,838 ms; 1,016 retimed cues were committed through direct-index mapping and Arabic captions were visually confirmed. The same process remained alive and AndroidRuntime's crash buffer was empty during these observations.

**Remaining intermittent failures:** the cold-start attempt returned no confident match after 12,913 ms. The subsequent explicit Arabic request succeeded, but an additional later language-selection attempt produced no new sync events within the 30-second observation window. Its cause was not established. These observations do not establish that every selection succeeds; physical-TV testing and further diagnosis of intermittent failures remain necessary. This release repairs the two verified regressions and does not claim perfect synchronization for every attempt or source.
