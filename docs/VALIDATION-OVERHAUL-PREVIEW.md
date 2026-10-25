# Mira overhaul preview validation

[Download the release and machine-readable reports](https://github.com/4marawan001/Mira/releases/tag/v0.6.0-preview.1) · [Install](INSTALL-OVERHAUL-PREVIEW.md)

Compilation, package checks, simulator checks and physical playback establish different things.

| Area | Fire TV 196 | Mac 197 | iPhone/iPad 194 | Android mobile 195 |
| --- | --- | --- | --- | --- |
| Main layouts | Physical TV; five Settings designs checked in 195, retained in 196 | Main layouts, navigation, Settings, Saved, details and poster actions checked | Debug simulators; phone Apple/Netflix checks, iPad Apple portrait/landscape | Shared source compiled; physical UI unavailable |
| Menus/navigation | Home and genre Menu/hold/details/Back passed | UI checks; teardown/source-failure regression tests | Navigation, Settings/More and Live TV checked | Host tests; physical device unavailable |
| Artwork/corners | Physical focus/label checks and tests | Geometry/artwork tests and preview | Landscape artwork, portrait/landscape sidebar and density checks | Geometry/artwork host tests |
| Fast scrolling | Measured; still drops frames | No controlled frame-pacing claim | No physical timing measurement | Physical timing unavailable |
| Quality/sources | Existing account setup retained | Ranking/filter tests; live check below | Existing iPad 4K Balanced target retained; hardware playback unverified | Ranking/filter tests; hardware playback unverified |
| EN/AR subtitles | Dialogue timing unverified | Selection/delay tests and offline HUD fixture; dialogue timing unverified | Dialogue timing unverified | Dialogue timing unverified |
| Live TV | Empty section checked | Empty section checked | Empty section and iPad rotation checked | Source compiled |
| Release packages | Three signed APKs checked; ARMv7 installed on TV | DMGs, signatures, native architectures, JVM and eager native binding checked | Universal Release IPA; identity, version, families, arm64 app/widget/frameworks and ZIP checked | Four signed APKs; identity, version, ZIP and every native ELF architecture checked |
| Updates/signing | Existing stable channel retained | Existing installer tests; preview stays manual | Helper checks passed; physical signing/renewal unverified | Mira package/build/CPU/signer policy tested; full device installer unavailable |

MAC-UNIT-RESULTS.json records 142 selected tests, ANDROID-UNIT-RESULTS.json 140, and TV-UNIT-RESULTS.json 56, with zero failures/errors/skips. The Mac selection includes source-failure and player lifecycle regressions. The 26 existing update-helper checks cover feed, identity and caching; they do not establish a physical Sideloadly renewal.

## Mac playback

An earlier 194 candidate had a bundled libmpv/libplacebo ABI mismatch that architecture/signature checks missed. Build 197 uses a matched dependency closure. A new eager-binding/initialization check runs against both final packaged architectures; the Intel check runs through Rosetta, not an Intel host. Runtime checks are not a substitute for rendering video.

Mac 197 rendered a cached 1080p HEVC sample through the final release classes/runtime in an isolated local profile. Keyboard pause and Escape/Back were checked. A deliberate unavailable HTTP 404 source produced a clear error, and Go back returned to the source picker. Full mouse-panel interaction, 4K/HDR output and actual subtitle dialogue timing remain unverified.

The offline native-HUD fixture exercised Play/Pause, seek, English/Arabic selection, subtitle delay, audio selection, speed and Escape callbacks. That fixture did not decode video or establish dialogue synchronization. Failed links must produce a source error; one provider failing does not establish that all providers or all titles fail.

## TV performance

PERFORMANCE.json records the device, existing resolution override, matched remote input and before/after results. Some frame-time tails and missed-deadline counts improved while janky-frame percentages increased. The TV is not consistently butter-smooth. Measurements used changing live catalogs/caches rather than a frozen laboratory dataset. The 196 changes wire grid menus; recorded renderer measurements are from 195.

Genre-grid Back returns to the grid, but details-return focus can land on Back instead of the exact poster. No resolution change or Home-button helper removal was part of these checks.

## Remaining checks

Physical iPhone/iPad and Android devices were unavailable. Simulators do not establish battery life, native decoder support or physical-device frame pacing. Intel native initialization through Rosetta does not establish behavior on an Intel Mac.

HDR/Dolby Vision output, tone mapping, native audio formats and actual English/Arabic dialogue timing remain unverified across supported devices. Embedded tracks, manual selection and delay remain available for release/cut/frame-rate mismatches.

The user deferred a playlist. Live TV is an empty destination: import, channel browser, guide and sports playback are not connected. Mac M3U/XMLTV parser tests cover source foundations only.

Account and provider settings were preserved during this overhaul. QA used disposable local Mac data. Raw source URLs, credentials, account files and private diagnostic logs are excluded from the release.
