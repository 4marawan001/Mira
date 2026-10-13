> The source and checks are ready. The Release IPA is still compiling and has not been published.

# Mira 0.5.13 · iPhone build 158

[Download the iPhone IPA](https://github.com/4marawan001/Mira/releases/tag/v0.5.13) · [Source patches](../updates/158)

This release brings the random video excerpt preview to the iPhone IPA. Mac remains at 0.5.12 / build 157 and Fire TV remains at 0.5.10 / build 155. The update manifest points to the current package for each platform.

## Try it on iPhone

1. Install `Mira-ios-158.ipa` with Sideloadly using the same Apple ID and signing options as your existing Mira app. Keep the existing app installed to preserve its local data.
2. Open **Settings → Look & feel → Browsing → Videos**.
3. Press and hold a poster in Home, Search, Saved or a full catalog grid.

Mira uses a supplied trailer or preview first. If none resolves, it asks compatible enabled add-ons for a ready direct video stream, chooses a random starting point and plays a muted excerpt for up to 30 seconds. Short videos may finish sooner. Close the sheet to stop playback. Movies & shows remains the default.

Preview requests have timeouts and cancellation, and do not write watch progress. Sources that expose no ready direct stream, cannot report a duration or cannot seek may not provide an excerpt. The preview does not start torrent downloading or debrid resolution.

![Mira browsing](https://raw.githubusercontent.com/4marawan001/Mira/main/docs/assets/home.jpg)

## Validation

- 102 existing catalog, search, playback-ranking, startup and update-feed regression checks passed.
- All 10 preview checks passed on the iOS simulator: excerpt boundaries, efficient direct-stream selection, missing previews, fast and stalled providers, and cancellation.
- The Debug iPhone 12 mini preview built and opened. The settings layout was inspected at 375×812 points. Computer control could not scroll the Device Hub window, so a complete interactive preview playback check remains pending.
- The Release IPA is unsigned for Sideloadly signing. Package integrity, arm64 executables, app identity and version are checked before publication.

Physical iPhone playback, random seeking, mute and dismissal still need device testing. Mac frame-rate and real-provider preview limitations documented in build 157 remain. No new Mac or TV binary is included in this release.

## Source

Verified patches against the exact build 155 source archives are included with base checksums and reconstruction instructions. The iPhone patch now matches Release 158; the Mac patch still matches Release 157. Original licenses and acknowledgements remain in the base archives. Saved account data and private signing keys are excluded.
