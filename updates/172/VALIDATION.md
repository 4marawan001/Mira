# Fire TV 172 validation

**Release 0.5.28 / build 172.** The existing package identity and MiraPersonal certificate are required for an in-place update. The package verifier checks all three APKs, their ABI contents, actual manifest versions, signatures and ZIP integrity. Hashes are published alongside the packages.

## Regression checks

224 selected JVM checks passed, with zero failures, errors or skips. Suites cover subtitle parsing/encoding, HTTP body bounds and cancellation, language/release/FPS ranking, provider-diverse candidate selection, subtitle routing/selection races, sidecar lifecycle, timing alignment/abstention/cancellation, resource limits, device-aware stream quality, focus scrolling, browsing and update verification. XML results are retained locally; SUBTITLE-VALIDATION.json identifies suites and counts.

The added resource checks verify that raw and transcoded bitmap formats bypass the timing observer without a duplicate read; oversized analysis samples are forwarded to playback without decoding; raw text can provide timestamps without another payload copy; cue history drops prior movies and remains bounded; excessive DP inputs are rejected; cancellation stops analysis; discs with over 100 subtitle tracks are reduced to at most four primary references plus one forced fallback before activity-array preparation, preserving the requested language; and the allocator leaves heap headroom on 128/256/512/2048 MB heaps. Provider-coverage checks verify that hundreds of repeated SubSource results cannot fill the bounded shortlist before OpenSubtitles, while the highest-ranked candidate remains first and duplicate URLs are removed.

The source archive excludes local account/configuration/signing data and caches. Its patch is checked, applied against the build-155 base, and the changed files compared with the packaged source. Runtime AARs are included in the full source archive.

## Emulator and limits

The dedicated API 31 Android TV ARM64 emulator is configured with 1 GB guest RAM and two CPU cores. Tests use a locally generated 150-second H.264 video, synthetic Arabic/English SRT cues, an invalid subtitle response, over 200 entries from one synthetic provider and a separate OpenSubtitles-named test fixture. No user accounts, private add-on URLs, copyrighted movie media or real OpenSubtitles API are used. Preliminary signed-build checks before the final reference-pool cap retained the guest setup and both test providers. Automatic Arabic selection skipped an invalid top-ranked response, selected the usable OpenSubtitles-named fixture, and displayed Arabic. Manual selection invoked SELECTED_ONLY, and the file picker displayed its active checkmark. PRELIMINARY-UI-OBSERVATIONS.json records those earlier observations; UI-SMOKE.json records the rebuilt final package checks and screenshots.

The rendering fixture has no embedded timing reference. Matching/cancellation are checked with synthetic JVM timelines; this is not a Backrooms full-film synchronization test. Correcting timing requires a usable reference and confident alignment. Unsupported or oversized analysis inputs retain original subtitle timing and remain available for manual playback/control.

The physical Insignia TV is not connected over ADB, so its process-exit logs were unavailable. The original exit has not been reproduced on that TV and the resource fixes do not establish a single confirmed crash cause. Physical UHD playback, subtitle switching, appearance/timing controls and the real configured provider responses remain device checks. No promise of zero lag, measured 60fps or exact synchronization for every cut is made.

Earlier unrelated vendored failures are not claimed fixed: LocalhostZeroCopyDataSourceTest.testHttpError404 and DefaultAllocatorTest.testLateReleasedAllocationsMemoryLeak. They are outside this selected suite.

The shared update feed preserves iPhone 168 and Mac 169 byte for byte. The iPhone lookup is unchanged. Install over the existing app; do not uninstall to update.

Final rebuilt package checks passed: six active language/provider selections, explicit selected-file-only analysis, Arabic rendering after closing the panel, file checkmark, appearance controls, header navigation and Off. The same playback process remained active and its crash buffer was empty. These checks used the final ARM64 APK hash recorded in UI-SMOKE.json.
