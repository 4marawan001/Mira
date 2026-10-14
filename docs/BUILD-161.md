# Mira 0.5.16 · iPhone build 161

[Download the iPhone IPA](https://github.com/4marawan001/Mira/releases/tag/v0.5.16) · [Source patches](../updates/161)

This release replaces random excerpt starting points with deterministic 0:20 previews on iPhone. Mac remains at 0.5.12 / build 157 and Fire TV remains at 0.5.15 / build 160. The update manifest points to the current package for each platform.

## What's new on iPhone

1. **Deterministic 0:20 Excerpt Start**:
   - For direct video streams (when no trailer resolves), previews now seek immediately while paused to 20,000 ms (0:20) and play for up to 30,000 ms (0:20–0:50).
   - Previews never play the initial 20 seconds beforehand, never wait 20 seconds in real time, and never choose a random timestamp.

2. **Short-Video Timing Rules**:
   - **Videos between 20s and 50s**: Start at 0:20 and stop at the actual video end.
   - **Videos lasting 20 seconds or less**: Start at 0:00 and stop at the actual end.
   - **Unknown duration or unsupported seeking**: Displays a clear unavailable-preview state (*"Preview unavailable for this video."*) instead of an endless loading spinner.

3. **Interface Copy Updates**:
   - Removed all occurrences of *"Random excerpt"* from the interface and documentation.
   - Previews now state their exact timing:
     - *"Muted preview · Starts at 0:20 · Up to 30 seconds"*
     - *"Muted preview · Starts at 0:20 · Plays to end"*
     - *"Muted preview · Starts at 0:00 · Plays to end"*
     - *"Muted trailer or preview clip"* (when playing a supplied trailer)

4. **Preserved Preview Constraints**:
   - Previews remain exclusive to Videos browsing mode; Movies & Shows mode is unaffected.
   - Supplied trailers remain the first choice.
   - Playback is muted, custom headers are sent, provider timeouts are enforced, and closing/scrolling stops playback and frees resources.
   - Previews do not write to watch progress, history, or Continue Watching.
   - No background torrent downloads or debrid resolutions are initiated.

## Try it on iPhone

1. Install `Mira-ios-161.ipa` with Sideloadly using the same Apple ID and signing options as your existing Mira app. Keep the existing app installed to preserve local settings, watch history, and profiles.
2. Open **Settings → Look & feel → Browsing → Videos**.
3. Press and hold any video poster on Home, Search, Saved, or a full catalog grid to open the preview.

## Validation

- **Boundary Unit Tests (13 passed, 0 failures)**: Tested deterministic 0:20 seeking and duration boundaries at 10s, 20s, 21s, 35s, 50s, 120s, and unknown durations in `:composeApp:iosSimulatorArm64Test`.
- **Catalog Regression Suite (102 passed, 0 failures)**: All repository and catalog integration tests passing cleanly.
- **Simulator Layout & Playback**: Verified on iPhone 12 mini simulator (`6C6AA830-3985-4D52-9C10-1FE6C9E19B46`). Unit tests and simulator checks verify seeking, timing boundaries, and UI presentation; physical-iPhone testing remains recommended for device gesture feel and carrier stream performance.
- Built with release bundle ID `com.nuvio.media`, preserving the Sideloadly upgrade path.

## Source & Patches

Verified reconstructable patches against base build 155 source archives are included with checksums in `updates/161/SOURCE.md` and `updates/161/Mira-source-deltas.json`. Original licenses and acknowledgements remain in the base archives. Saved account data and private signing keys are excluded.
