# Mira Fire TV 180 · Reliable subtitle preparation

External subtitle correction now reaches its matcher before repeated provider ranking or speculative preparation exhausts its deadline. Source metadata and fixed patterns are reused, unchanged provider lists are ranked once per run, and a ready candidate is evaluated before preparing more providers. Validated corrections survive later search expiry; leaving playback or switching subtitle still cancels obsolete work. Restored subtitles invoke correction, and late provider results cannot replace a newer choice. ASS override parsing is portable on Android. Release per-frame diagnostic logging is disabled.

## Verified

- 116 focused tests across 15 suites: zero failures/errors. Includes timing, cancellation, restoration, sidecar lifecycle, index loading and release ranking. This is not a new full-suite pass.
- Signed Release packages: ARMv7, ARM64 and universal, same package/signing identity. ZIP/source patch integrity verified.
- Physical Insignia TV: user confirmed external Arabic and English in sync on Backrooms, with English after app restart and Arabic selected again in that restarted session. Cold analysis completed in roughly 12–16 seconds; warm Arabic analysis took about four seconds. Original captions may show before correction completes.
- The user separately reported flawless results on two additional movies; their titles/files/timings were not recorded, so these are user reports rather than instrumented tests.

## Limits

Automatic matching compares subtitle timing with a usable embedded timeline, rather than listening to dialogue. Unsupported/no-reference videos, different cuts, provider omissions and later-film drift can still need manual adjustment. Sustained frame-rate performance and every movie/provider are not certified. Mac 169 and iPhone 168 remain unchanged in this TV release; their automatic matcher ports are separate work.

Install over Mira to preserve data. Source archive and checked patch from build 155 are included. The shared manifest preserves current iPhone and Mac entries. Android-based Fire TV only, API 24+.

[Release and downloads](https://github.com/4marawan001/Mira/releases/tag/v0.5.36) · [Source and publishing](RELEASING.md)
