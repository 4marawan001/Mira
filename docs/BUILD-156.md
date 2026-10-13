# Mira 0.5.11 · Mac build 156

[Download Mac build 156](https://github.com/4marawan001/Mira/releases/tag/v0.5.11) · [Source patches](../updates/156)

This release updates the Apple Silicon Mac app. The released iPhone IPA and Fire TV APK remain at 0.5.10 / build 155, available from [build 155](https://github.com/4marawan001/Mira/releases/tag/v0.5.10).

## Mac automatic updates

Mira checks on opening and hourly while the app stays open. It downloads newer Mac packages automatically, verifies their SHA-256 checksum, and shows **Install & Restart**. Installation keeps the previous app for recovery and preserves settings stored outside the app bundle. A download does not restart playback automatically. Checks stop when Mira is closed.

## Videos mode

When no trailer resolves, Videos mode tries compatible enabled add-ons for a direct stream and plays a muted random excerpt lasting up to 30 seconds. Short videos can end earlier. Hover away, scroll or close the preview to stop it. Provider requests have timeouts and cancellation; previews do not write watch progress. Sources that expose no ready direct stream cannot supply the excerpt.

Movies & shows stays the default. Turn on Videos in Settings → Look & feel → Browsing. The iPhone implementation is included as preview source only; it is not in the released build 155 IPA.

## Scrolling and logo

Mac poster image crossfades are disabled, card highlight drawing is cached, and hover scaling is suppressed during scrolling. To see the logo dance, leave Home open without scrolling for ten seconds with Reduce Motion disabled.

![Mira Home](https://raw.githubusercontent.com/4marawan001/Mira/main/docs/assets/home.jpg)

## Validation

27 focused checks passed: 10 preview checks, 7 updater repository checks, 8 version checks and 2 real Mac installer checks in temporary folders. The installer tests exercised signed app replacement, retained backups, paths with spaces, and rejection of another bundle identifier. The Release app signature and DMG integrity passed verification.

Five broader desktop test failures documented in build 155 remain unresolved. Real-provider excerpt playback, sustained Mac frame rates and physical iPhone/TV performance remain unverified. These changes reduce rendering work; there is no zero-lag guarantee.

## Source

This release includes small verified source patches against the exact source archives in build 155, plus reconstruction instructions. The Mac patch contains build 156; the iPhone patch contains newer preview code. Original licenses and acknowledgements remain in the base source archives. Saved account data and private signing keys are excluded.
