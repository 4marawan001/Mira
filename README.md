# Mira

Personal builds for iPhone, Apple Silicon Mac, and Fire TV, based on the open-source Nuvio apps. Mira has a quieter interface, silver branding, cinematic browsing, and a shared Home / Search / Saved navigation style.

Download packages, source archives, patches, checksums, and detailed test results from **Releases**. These are personal testing builds. Read each release's known limitations before installing.

The iPhone IPA requires signing with Sideloadly. The Mac app supports Apple Silicon and is ad-hoc signed. The Fire TV APK supports ARMv7 and ARM64 Android/Fire OS devices with Android 7 or later; it has not been tested on every TV model.

## Updates

The `mira-updates.json` asset in the latest release supplies version, build, download URL, and SHA-256 checksums. Mac and Fire TV download updates and require installation confirmation. iPhone updates use the optional Mac helper and Sideloadly; signing refresh is separate.

## Source and licenses

Each release includes the exact Mira source snapshot and a patch against its recorded upstream commit. Original licenses and acknowledgements are retained in the archives. Upstream projects:

- https://github.com/NuvioMedia/NuvioMobile
- https://github.com/NuvioMedia/NuvioDesktop
- https://github.com/NuvioMedia/NuvioTV
- https://github.com/NuvioMedia/nuvio-engine

Mira is a personal fork, not an official Nuvio or Apple product. No user account data or private signing keys are included in this repository or its release assets.
