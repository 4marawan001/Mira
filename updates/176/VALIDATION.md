# Mira Fire TV 176 (`v0.5.32`) Validation Report

## 1. Test Suite Summary
- **Target**: `:app:testFullReleaseUnitTest`
- **Total Tests Executed**: 202
- **Pass**: 202
- **Failures**: 0
- **Errors**: 0
- **Skipped**: 0
- **Test Suites Covered**:
  - `StreamAutoPlaySelectorTest` (19 tests)
  - `SubtitleCandidateCoverageTest` (3 tests)
  - `SubtitleCharsetDetectorTest` (43 tests)
  - `SubtitleReleaseRankingTest` (12 tests)
  - `PlayerRuntimeControllerBestSubtitleTest` (8 tests)
  - `AutoSyncSearchDeadlineTest` (5 tests)
  - `AutoSyncTimelineRetimeTest` (38 tests)
  - `AutoSyncObserverResourceTest` (10 tests)
  - `SidecarSubtitleLifecycleTest` (4 tests)
  - `SubtitleCredentialScopeTest` (8 tests)
  - `SubtitleBodyRequestTest` (4 tests)
  - And all other player/subtitle unit test suites.

## 2. Independent Codex Verification
Codex independently verified the 38 retimer and privacy diagnostic tests in an isolated JUnit harness, passing 38/38 tests.

## 3. Package and Binary Verification
All three release APK packages built with R8 full release minification and signed with the existing `MiraPersonal` certificate:
- `Mira-FireTV-universal.apk`:
  - Size: 134,512,467 bytes
  - SHA-256: `985a806b85fb74650b4b2ef70128d751b303c1fcfce892235a31051878248839`
  - ABIs: `arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64`
- `Mira-FireTV-arm64.apk`:
  - Size: 54,004,593 bytes
  - SHA-256: `c0659228b07f11f7b5833106ac41222bb4a65d9d9819c8a0f07abb5d171d39d7`
  - ABIs: `arm64-v8a`
- `Mira-FireTV-armv7.apk`:
  - Size: 52,015,635 bytes
  - SHA-256: `29e20a9ce373d03a0b70f6b32c65ade6164242cea2af5f7aec3a56a530ae6e76`
  - ABIs: `armeabi-v7a`

All APKs verified via `aapt dump badging` for `name='app.mira.tv'`, `versionCode='176'`, `versionName='0.5.32'`.
All APKs verified via `apksigner` scheme v2 for certificate SHA-256 `9ee1ac4c7d4b305cba2fa2defd10dd7a330cb9ff48097f580e17953fe2974bba`.
ZIP archive integrity tested via `zipfile.testzip()`.

## 4. Important Validation Boundaries
Physical Insignia subtitle timing and sustained performance remain unverified on hardware. Automated JVM test passes do not constitute a guarantee that every subtitle provider, video stream, or audio format will synchronize without manual adjustment.
