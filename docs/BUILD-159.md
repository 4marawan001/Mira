# Mira 0.5.14 · Fire TV build 159

[Download the Fire TV APK](https://github.com/4marawan001/Mira/releases/tag/v0.5.14) · [Source patches](../updates/159)

This release brings automatic Arabic and English subtitle synchronization and release matching to the Fire TV APK. iPhone remains at 0.5.13 / build 158 and Mac remains at 0.5.12 / build 157. The update manifest points to the current package for each platform.

## Subtitle improvements on Fire TV

1. **Automatic Arabic Windows-1256 & UTF-8 Detection**:
   - Detects Arabic Windows-1256 single-byte encoding reliably even without language hints or definite articles ("ال").
   - Employs strict script guards (`bytes0xC0to0xDF >= 2`, Russian vowel exclusion, Greek vowel exclusion) to prevent false-positive collisions with Cyrillic (Windows-1251), Greek (Windows-1253), Hebrew (Windows-1255), and CJK (GB18030 / Shift_JIS / EUC-KR).

2. **Double-Encoded UTF-8 Mojibake Repair**:
   - Automatically detects and repairs double-encoded Arabic UTF-8 text where single-byte Windows-1256 characters (`0xC1..0xFE`, `0xBA`, `0xBF`) were mis-decoded as Latin-1/Windows-1252 and saved as UTF-8.

3. **Stream-Aware Release & FPS Ranking**:
   - Ranks available subtitle candidates against the active video stream's metadata (release group tags such as YTS, SPARKS, RARBG, PSA; video source Bluray/Web-DL; codec x264/x265; resolution 1080p/2160p; and target frame rate / FPS).
   - Prioritizes matching releases while preserving the user's preferred language ordering.

4. **Unicode Bidi Control Normalization**:
   - Strips directional formatting characters (`\u200E`, `\u200F`, `\u202A`..`\u202E`, `\u2066`..`\u2069`, `\uFEFF`) and filters empty phantom cues so timeline correlation and speech activity detection remain accurate.

5. **Activity Correlation Drift Alignment**:
   - Verified alignment for frame-rate drift (such as 25.0 fps PAL to 23.976 fps NTSC) against embedded reference cues using activity correlation.

6. **Preserved Manual Controls**:
   - Manual subtitle track selection and manual delay adjustment controls remain completely intact.

## Validation

- **91 focused tests passed**: Covering `SubtitleCharsetDetectorTest`, `StreamAutoPlaySelectorTest`, `AutoSyncSubtitleCueParserTest`, and `AutoSyncTimelineRetimeTest`.
- **611 package tests passed**: All `com.nuvio.tv.core.player.*` and `com.nuvio.tv.ui.screens.player.autosync.*` tests passed with 0 failures and 1 skipped.
- **Signing verification**: Signed with the official Mira release key (`CN=Mira Personal, OU=Personal, O=Mira, C=US`, SHA-256 digest `9ee1ac4c7d4b305cba2fa2defd10dd7a330cb9ff48097f580e17953fe2974bba`), verifying a seamless upgrade path over build 155.
- Package name `app.mira.tv`, version `0.5.14`, build `159`.
- Unit tests verify parser and retimer logic; physical TV hardware testing for remote responsiveness and edge-case display remains recommended.

## Source

Verified patches against the exact build 155 source archives are included with base checksums and reconstruction instructions in `updates/159/SOURCE.md` and `updates/159/Mira-source-deltas.json`. Original licenses and acknowledgements remain in the base archives. Saved account data and private signing keys are excluded.
