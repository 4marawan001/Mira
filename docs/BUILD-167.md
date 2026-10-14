![TV quality picker](assets/firetv-167-quality.png)

![TV poster rows](assets/firetv-167-posters.png)

# Mira Fire TV 167 · 0.5.22

Mira’s TV edition now brings its cinematic Home and compact source picker closer to the iPhone and Mac experience, with remote controls throughout.

- **Automatic quality:** Low Data favors smaller 1080p copies. Balanced favors hardware-supported 4K on a capable 4K display, otherwise 1080p, with a 30 GB-per-two-hour budget scaled by known runtime. Highest favors the highest hardware-supported resolution, then disc/REMUX sources. Unknown sizes stay manual in Balanced.
- **Device-aware selection:** cached Android hardware-decoder and display checks inform ranking. Known unsupported codecs/resolutions stay available for manual selection. Existing hardware-first playback still validates the actual format when it opens.
- **Lighter browsing:** removed duplicate legacy catalog presentation work, bounded poster decoding, reduced simultaneous image downloads, removed source-menu capture blur and an unnecessary poster layer, and reduced unnecessary focus scrolling.
- **Autoplay coordination:** serializes provider responses and timeout-driven ranking to prevent competing playback choices.
- **Cleaner playback menu:** one recommended source, compact quality/size/provider rows, and file details on Menu or long Select. The hero Play button now starts the playback route.
- **Fresh-install fix:** Home keeps Search, Saved, Settings, and source setup reachable even when there are no add-ons or catalogs.
- **Updates:** signed with the existing Mira TV certificate; installs over the previous TV build. iPhone and Mac releases remain independent.

See VALIDATION.md for exact test results and remaining physical-TV checks. Emulator timings do not establish smoothness on an Insignia TV. No hover/video previews or logo dance were added to TV.

# Fire TV 167 validation

## Automated checks

- Focused Release JVM suite: 424 tests total; 423 passed, one skipped, zero failures. Covers player policies, Home, Search, subtitle synchronization, decoder-aware ranking, size budgets, source filters and remote scrolling.
- New tests: 18 quality/device policy cases and four focus-scrolling cases, all passed. Includes 1,200 distinct synthetic candidates, unsupported AV1/Dolby Vision, decoder resolution limits, exact size-budget boundaries, episode-runtime scaling and source/binge-group constraints.
- Broad suite before the final empty-Home UI repair: 2,101 total; 2,098 passed, one skipped, two failures. The same two pre-existing failures are recorded in the earlier project handoff: `LocalhostZeroCopyDataSourceTest.testHttpError404` and `DefaultAllocatorTest.testLateReleasedAllocationsMemoryLeak`. They exercise unchanged vendored Media3 AARs; this update does not rebuild that engine.
- The first signed-APK remote smoke test found an empty-account navigation dead end. It was fixed before publication; final smoke results are recorded below. External catalog loading did not work in the emulator, so populated-Home checks use a local metadata-only catalog with public Cinemeta artwork; this is not a provider/network playback test.
- Full source ZIP integrity and a patch applied against the public build-155 source archive are checked. Source packaging excludes local credentials, private signing keys, caches and account data.

## Device-aware selection limits

Android's advertised hardware decoder support is checked by MIME type, dimensions and a 30 fps capability probe. Balanced uses the advertised display resolution and the metadata supplied by providers. It does not measure bandwidth, inspect the real picture, or guarantee every profile, bit depth, frame rate, HDR mode, audio track or container. The playback renderer performs its existing actual-format decoder check when playback opens. Missing/incorrect provider metadata can still require manual selection; known unsupported codecs are manual-only in the new quality modes.

The default two-hour budget applies if runtime is unavailable. Existing saved Manual, First Link, Regex, source filters, settings and profiles are preserved; select Settings → Automatic quality → Balanced to use the new ranking on an existing installation.

## Remaining physical-TV checks

Not tested on the user's physical Insignia 50-inch 4K Fire TV. Verify real poster scrolling, remote focus, account sync, provider playback, 4K HEVC/HDR/audio compatibility, resume/next episode, and in-app installation. No claim of measured 60 fps or zero lag is made. Requires Android 7/API 24 or later.

## Final signed-APK emulator result

The D-pad smoke test passed (one test, 57.776 seconds): Home navigation, each quality choice, saving Balanced, installing the local preview catalog, populated Home and repeated poster-row navigation. Home, poster and quality screenshots were visually inspected. The emulator used 1.5 GB configured RAM and Android TV API 31 on ARM64.

A short emulator diagnostic recorded 167 frames: median 25ms, 90th percentile 81ms, 95th 109ms and 99th 150ms. Modern/legacy counters disagree and GPU timestamps are unusable. These emulator counters are not evidence of zero lag, 60 fps or an improvement over the previous APK. No controlled physical-TV comparison was performed.

APK verification: package `app.mira.tv`, version `0.5.22`/167, minimum API 24, universal ARM64/ARMv7/x86/x86_64. Its signing certificate matches the previous Mira TV release. No app source file changed after the final APK was built.

The final rebuild also serializes provider responses and timeout-driven ranking with a per-session mutex, so suspended ranking cannot overwrite newer state or trigger competing autoplay decisions.

## Install

On an existing Mira TV installation, open Settings → Updates and check for the new release. The APK uses the existing signing certificate and application ID, so installing it over the previous build preserves local app data. Android still requires confirmation to install. For a new installation, download `Mira-FireTV-universal.apk` from release v0.5.22. Separate ARM64 and ARMv7 APKs are also supplied if you already know your TV’s architecture.
