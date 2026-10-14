# Mira Mac 169 source

Use `Mira-macOS-source-169.zip` for the complete Mac source, including verified Intel and Apple Silicon playback libraries. It excludes installed account data, private signing keys, local configuration and build caches.

Alternatively restore the Mac source archive from build 155, then apply `Mira-macOS-changes-from-155.patch`. The patch was applied to the base and all modified source files compared. Restored upstream LFS runtimes are excluded from the text patch; the full archive includes them.

Mac 169 is 0.5.25. iPhone 164 and Fire TV 162 retain their independent versions. See VALIDATION.md for checks and limitations.
