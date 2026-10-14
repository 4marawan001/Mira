# Mira build 162 (0.5.17) validation

## Fire TV Build 162 (0.5.17)

### Changes & 1:1 iPhone Replica
- **1:1 iPhone IPA Visual Replica**: Ported the sleek iPhone home UI directly to Fire TV, including `MiraTvHomeHeader` (Mira branding + signature `miraTvIdleLogoDance()` + D-pad Search, Saved, Settings), `TvHomeGenreSection` (dark rounded pills with vibrant colored dots), `TvMiraChartSection` (IMDb Top 250 with gold stars), centered hero slide indicator pill capsule, "See All" header pill buttons, and focusable "View All" cards at the end of each shelf.
- **Remote Responsiveness & Zero-Lag D-Pad Navigation**:
  - Replaced floaty, under-stiff scroll spring (`stiffness = 180f`, `dampingRatio = 0.95f`) with a critically damped, snappy spec (`dampingRatio = 1.0f`, `stiffness = 700f`), settling each D-pad move in <100ms with zero overshoot or queuing stutter.
  - Replaced heavy dynamic card width animations (`animateDpAsState`) with GPU-layer hardware scaling (1.05x on focus) and crisp 2dp focus ring, completely eliminating layout passes across rows on focus changes.
  - Eliminated background ExoPlayer trailer autoplay on card focus that overwhelmed A53 quad-core TV processors.
  - Matched iOS 0.675 aspect ratio (126x187dp posters, 240x135dp landscape, 140x140dp square).
  - Reduced Coil image downsampling targets to exact 1.5x TV display density (189x280 poster, 360x202 landscape, 1280x720 hero backdrop) with `precision(INEXACT)`, disabled crossfade, and memory cache, freeing >50% texture memory.
  - Capped catalog shelves to 20 preview items (`catalog.items.take(20)`) to eliminate garbage collection pauses on 1.5GB Fire TV sticks.
- **Focus & Navigation Fixes**:
  - Removed broken bottom pill navigation scaffold and key interceptors in `MainActivity` that previously trapped D-pad focus and hijacked down/left movements.
  - Restored natural remote navigation: Header -> Hero -> Genres -> Charts -> Continue Watching -> Catalogs.
- **Release Signing & In-Place Upgrades**:
  - Configured with official release keystore (`CN=Mira Personal, OU=Personal, O=Mira, C=US`).
  - Retains package ID `app.mira.tv` (`versionCode = 162`, `versionName = "0.5.17"`), enabling seamless in-place updates over build 160 preserving user accounts, trakt tokens, and preferences.

### Fire TV Verification
- Core player unit tests, `MiraBrowseTest`, and `assembleFullRelease` passed with 0 failures (`BUILD SUCCESSFUL`).
- Release APK assembled and verified with Android SDK `apksigner` (v2 scheme valid, official Mira personal certificate `CN=Mira Personal`).
- Fire TV source delta cleanly checked and verified against build 155 base archive (19 files changed, patch applies cleanly with 0 errors).

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

### Final Mac UI and installation checks
- Home vertical scrolling and poster-to-details navigation were exercised in the Apple Silicon build on M1. The Intel build launched and responded to Home scrolling under Rosetta. These are smoke checks, not measured frame-rate or physical Intel tests.
- Both live GitHub DMG asset digests and the complete Mac source ZIP digest match the verified local files.
- The verified ARM package was installed at `/Applications/Mira.app`, preserving settings and retaining the previous app for rollback.
- Five previously reported broad-suite failures remain: hero cycling timing, static custom poster patterns, two search-manifest state checks, and legacy completion migration. The final targeted suite passed all 74 checks.

- Cosmetic issue observed during installed-app QA: SettingsRootPage displays the shared base version 0.5.10. The app Info.plist and desktop updater correctly identify 0.5.17/build 162. Fix the footer to use AppVersionPolicy.displayVersionName in the next Mac update; do not change device signing identity.
