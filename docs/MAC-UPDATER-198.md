# Mac updater repair · build 198

The updater could select the 0.6.0 preview, then verify it against the older stable manifest. This produced “Release changed. Check for updates again.” Build 198 uses the selected release’s own manifest and preserves SHA-256, repository, release and architecture checks.

## Install once

1. Quit Mira.
2. Download the [Apple Silicon DMG](https://github.com/4marawan001/Mira/releases/download/v0.6.1-preview.1/Mira-macOS-arm64.dmg) or [Intel DMG](https://github.com/4marawan001/Mira/releases/download/v0.6.1-preview.1/Mira-macOS-x86_64.dmg).
3. Open the image and replace Mira in Applications.
4. Open Mira. Profiles, add-ons and history are stored outside the app bundle.

The broken downloader in older builds cannot install this repair itself. This is an ad-hoc signed preview, not an Apple-notarized release. The stable feed remains unchanged. Other platforms continue using the [multi-platform preview](https://github.com/4marawan001/Mira/releases/tag/v0.6.0-preview.1).

## Verification

All 165 selected tests passed, including eight updater regressions. The actual packaged build 182 reproduced the error in isolated storage. The actual packaged build 198 downloaded the public preview’s complete 195,038,001-byte DMG and independently verified its SHA-256. Both Mac packages passed signature, disk-image, native architecture, bundled Java and native player initialization checks. Intel checks ran through Rosetta; physical Intel hardware was not tested.

[Release, validation reports and matching source](https://github.com/4marawan001/Mira/releases/tag/v0.6.1-preview.1). The broader overhaul preview’s unfinished performance, HDR and subtitle checks still apply.
