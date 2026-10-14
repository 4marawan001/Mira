# Mira build 162 (0.5.17) validation

## Fire TV Build 162 (0.5.17)

### Changes & 1:1 iPhone Replica
- **1:1 iPhone IPA Visual Replica**: Ported the sleek iPhone home UI directly to Fire TV, including `MiraTvHomeHeader` (Mira branding + D-pad Search, Saved, Settings), `TvHomeGenreSection` (dark rounded pills with vibrant colored dots), `TvMiraChartSection` (IMDb Top 250 with gold stars), and `MiraTvPosterCard` (fixed 126x189dp cards with 1.05x GPU scaling and crisp 2dp focus ring).
- **Smooth 60fps & Zero Lag on TV Hardware**:
  - Replaced heavy dynamic card width animations (`animateDpAsState`) with GPU-layer hardware scaling, completely eliminating layout passes across rows on focus changes.
  - Eliminated background ExoPlayer trailer autoplay on card focus that overwhelmed A53 quad-core TV processors.
  - Fixed-dimension 2x image downsampling (252x378) in Coil with disk and memory cache enabled.
- **Focus & Navigation Fixes**:
  - Removed broken bottom pill navigation scaffold and key interceptors in `MainActivity` that previously trapped D-pad focus and hijacked down/left movements.
  - Restored natural remote navigation: Header -> Hero -> Genres -> Charts -> Continue Watching -> Catalogs.
- **Release Signing & In-Place Upgrades**:
  - Configured with official release keystore (`CN=Mira Personal, OU=Personal, O=Mira, C=US`).
  - Retains package ID `app.mira.tv` (`versionCode = 162`, `versionName = "0.5.17"`), enabling seamless in-place updates over build 160 preserving user accounts, trakt tokens, and preferences.

### Fire TV Verification
- Core player unit tests and `MiraBrowseTest` passed with 0 failures (`BUILD SUCCESSFUL`).
- Release APK assembled and verified with Android SDK `apksigner` (v2 scheme valid, official Mira personal certificate).
- Fire TV source delta cleanly checked and verified against build 155 base archive (18 files changed, patch applies cleanly with 0 errors).

---

## Mac Build 162 (0.5.17)

### Changes
- Mac-only playback quality choice persisted locally, migrating the existing choice on first use. iPhone settings remain independent.
- Balanced prefers hardware-friendly 2160p within 30 decimal GB per 120 minutes. The budget scales to known movie/episode runtime; missing runtime defaults to 120 minutes.
- Known oversized files and unknown-size files require manual selection in Balanced. Highest remains available for original-quality remuxes.
- Actual VideoToolbox hardware decoder support queried once during native-runtime warmup. On this M1: AVC=yes, HEVC=yes, AV1=no. This is codec-level detection, not a guarantee for every codec profile, HDR variant, or provider label.
- Mac poster browsing draws content directly, avoiding a duplicate recorded GPU layer per poster. Zoom/context menus use the existing artwork fallback.
- Hover spring values are read in the graphics phase rather than recomposing the card on each frame.
- Native player extraction/warmup moved to a daemon thread; deferred controller callbacks avoid eager native loading.
- Packaged app JVM heap limited to 2 GiB.
- Intel-specific player libraries fetched and individually SHA-256 verified against their upstream LFS pointers. Intel JDK 17 verified against vendor checksum.
- Updater filters incompatible Mac architectures before selecting assets; manifest supports per-architecture SHA-256 values and preserves old ARM feed compatibility.

### Mac Verification
- Initial focused set: 43 tests passed. Final targeted set: 74 passed, zero failures.
- Intel JDK runs under Rosetta on M1.
- Existing Intel media libraries target macOS 10.15 or earlier; universal engine targets macOS 11. The app/bridge target is macOS 12+.
- Both Release DMGs passed disk-image checksum verification and strict deep ad-hoc signature verification.
- Apple Silicon package: 73 launcher/JVM/playback binaries checked for arm64. Intel package: 75 checked for x86_64. Package names, version 0.5.17/build 162, bundle identity and macOS 12 minimum verified.
- Both packaged playback bridges loaded successfully and returned decoder capabilities=3 (AVC+HEVC) on this M1, using native ARM Java and Intel Java under Rosetta respectively.
- Source ZIP integrity and a text patch applied against build 155 were verified.
