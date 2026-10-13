# Mira 0.5.10 · build 155

[Download this release](https://github.com/4marawan001/Mira/releases/tag/v0.5.10) · [Installation](INSTALL.md)

This update reduces rendering work during Home and poster browsing, and adds optional video previews on iPhone and Mac.

## Mac scrolling

The floating navigation uses a translucent-looking surface without capturing and blurring the whole page as it scrolls. Poster filtering is lighter, scroll-dependent state changes less often, and lazy shelves avoid replaying their entrance fades.

Animated collection artwork loads when hovered instead of eagerly. Hover previews stop while scrolling. Opening a long-press preview sheet suppresses the hover player so both do not run together.

![Mira Home on Mac](assets/home.jpg)

## iPhone and Mac additions

Settings → Look & feel → Browsing has Movies & shows and Videos modes. Videos enables muted hover previews on Mac and long-press preview sheets on iPhone. Preview metadata resolution has a timeout and supports cancellation. Clips depend on supplied trailer or preview metadata; Mira does not download a full movie to generate a preview.

The Home logo does a brief dance after ten stationary seconds. It stops when Home is inactive or scrolling and respects Reduce Motion.

![A supplied trailer playing in Mira's preview sheet](assets/video-preview.jpg)

## Fire TV

The TV app removes the full-page sidebar blur capture while keeping remote navigation. Videos mode and the logo dance are excluded.

## Validation

| Check | Result |
| --- | --- |
| Focused Mac tests | 19 passed, covering preview selection, browsing defaults, navigation, image hover lifecycle and hero sizing. |
| iPhone regression checks | 102 passed, including search pagination beyond 1,000 synthetic results. |
| Mac interaction checks | Home scrolling, horizontal shelves, settings and a trailer preview were exercised in build 155. |
| Fire TV remote navigation | Passed on an API 31 ARM64 emulator with software and Apple M1 hardware graphics. |
| Release packages | All three Release packages built. Mac signature, IPA archive and TV signing certificate checked. |
| Published downloads | All 15 release asset sizes and digests matched local files. The update feed and all three full app downloads passed checksum checks. |

The first full desktop test run executed 1,600 tests and reported ten failures. Three image-hover failures were fixed and passed on rerun. Two stale hero sizing assertions were updated to the current bounded layout and passed. Five failures remain unresolved:

- Automatic hero cycling from the last item to the first.
- A static custom-poster URL pattern without placeholders.
- Legacy completed watch-progress handling.
- Two search loading/empty-state expectations.

These failures are not reported as passing. The two previously reported TV bundled Media3 test failures were unchanged by this update.

Physical iPhone and Insignia Fire TV testing is still pending. TV emulator timings were uneven under build load and some guest artwork was incomplete. There is no measured before/after frame-rate claim or guarantee of zero lag.

## Packages and source

The iPhone IPA requires sideload signing. The Mac DMG is an Apple Silicon Release build with ad-hoc signing. The Fire TV APK uses the existing Mira signing certificate.

Release assets include source snapshots, patches, upstream base commits, the iPhone updater helper, release notes, the update manifest and checksums. Account data and private signing keys are excluded.
