# Mira 0.5.15 · Fire TV build 160

[Download the Fire TV APK](https://github.com/4marawan001/Mira/releases/tag/v0.5.15) · [Source patches](../updates/160)

This release provides corrective updates for subtitle character set discrimination, language alias ranking, and compound release tag matching on Fire TV. iPhone remains at 0.5.13 / build 158 and Mac remains at 0.5.12 / build 157. The update manifest retains the current package for each platform.

## Subtitle improvements and fixes on Fire TV

1. **Arabic & Cyrillic Script Discrimination**:
   - Corrected a regression where mixed-case Windows-1251 Cyrillic without language hints (such as `ПРИВЕТ! где он? он тут`) was misdetected as Arabic Windows-1256.
   - Competing script evidence (Russian vowels and distinctive consonants vs Greek vowels/tones vs Arabic base letters) is statistically evaluated before selecting an encoding.
   - Preserves robust Arabic Windows-1256 detection (both with and without "ال", and with Arabic punctuation) while preventing collisions with Cyrillic (Windows-1251), Greek (Windows-1253), Hebrew (Windows-1255), and CJK encodings.

2. **Language Code Alias Normalization**:
   - Subtitle ranking now normalizes equivalent language identifiers (e.g. `en` and `eng`, `ar` and `ara`, regional codes like `en-US` or `ar-SA`) using shared language matching before sorting.
   - Better-matching release candidates (e.g. matching `1080p.BluRay.SPARKS`) are no longer superseded by non-matching candidates simply due to two-letter vs three-letter code representation.

3. **Canonical Compound Release Tag Matching**:
   - Compound source tags (such as `WEB-DL`, `WEB.DL`, `WEBDL`, `Blu-Ray`, `BD-Rip`, `x264`, `H.264`, `x265`, `HEVC`) are now canonicalized before token delimiter splitting.
   - Preserves source identity and matches codec synonyms across stream titles and subtitle filenames.

4. **Double-Encoded UTF-8 Mojibake Repair**:
   - Automatically detects and repairs double-encoded Arabic UTF-8 text where single-byte Windows-1256 characters were mis-decoded as Latin-1/Windows-1252 and saved as UTF-8.

5. **Unicode Bidi Control Normalization**:
   - Strips directional formatting characters (`\u200E`, `\u200F`, `\u202A`..`\u202E`, `\u2066`..`\u2069`, `\uFEFF`) and filters empty phantom cues for reliable timeline correlation.

6. **Preserved Manual Controls**:
   - Manual subtitle track selection and manual delay adjustment controls (±50ms, ±100ms, ±250ms, ±500ms, ±1000ms) remain completely intact and take priority over automated sync.

## Validation

- **109 focused tests passed (0 failures)**: Covering `SubtitleCharsetDetectorTest` (including Russian mixed-case, all-caps, and Arabic counterexamples), `StreamAutoPlaySelectorTest` (including `en`/`eng` alias ranking and `WEB-DL` canonicalization), `PlayerRuntimeControllerAutomaticSubtitleSyncTest`, `AutoSyncSubtitleCueParserTest`, and `AutoSyncTimelineRetimeTest`.
- **296 player and auto-sync package unit tests passed** with 0 failures and 1 skipped container.
- **Signing verification**: Signed with the official Mira release key (`CN=Mira Personal, OU=Personal, O=Mira, C=US`, SHA-256 digest `9ee1ac4c7d4b305cba2fa2defd10dd7a330cb9ff48097f580e17953fe2974bba`), verifying a seamless upgrade path over build 155.
- Package name `app.mira.tv`, version `0.5.15`, build `160`.
- Character set detection and embedded-cue drift alignment represent heuristic best-effort algorithms validated across comprehensive test suites; real-world television HDMI passthrough latency and remote responsiveness remain recommended for end-user physical validation.

## Source

Verified patches against the exact build 155 source archives are included with base checksums and reconstruction instructions in `updates/160/SOURCE.md` and `updates/160/Mira-source-deltas.json`. Original licenses and acknowledgements remain in the base archives. Saved account data and private signing keys are excluded.
