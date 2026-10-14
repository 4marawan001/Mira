# Mira Mac 165 · 0.5.20

The Videos browsing mode forced automatic hover previews and direct-stream excerpts. Those previews can add decoder, network and rendering work during poster browsing. Mac browsing now stays in Movies & shows.

- Removed the Mac Videos selector from Layout.
- An existing saved Videos preference migrates to Movies & shows on launch; stale setters cannot turn it back on.
- Automatic hover-video playback is disabled even when an older hover-trailer flag is enabled. Its controls are hidden on Mac. Static poster hover cards and normal movie playback remain available.
- Device-aware playback modes, profiles, add-ons, library and other appearance settings retain their behavior.

67 focused checks passed, including six new migration and hover-playback guard checks, plus poster interaction, playback ranking and updater coverage. Both Apple Silicon and Intel Release packages passed signing, image integrity and architecture checks. The packaged Intel JVM runs under Rosetta.

Installed and launched on an M1 Mac. Layout and Hover Preview settings were visually checked; the removed controls are absent and the Settings footer shows 0.5.20. Automated scrolling was unavailable because computer control reported noWindowsAvailable. No measured frame-rate or zero-lag claim is made. Physical Intel testing remains outstanding.

These Mac packages are ad-hoc signed and target macOS 12 or newer. iPhone stays at build 164 / 0.5.19, and Fire TV stays at build 162 / 0.5.17. iPhone Videos mode is unaffected.

[Release assets](https://github.com/4marawan001/Mira/releases/tag/v0.5.20) · [Validation](https://github.com/4marawan001/Mira/releases/download/v0.5.20/VALIDATION.md)
