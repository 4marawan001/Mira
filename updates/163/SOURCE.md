# Mira Mac 163 source

The complete Mac source snapshot is `Mira-macOS-source-163.zip`; it includes verified Intel and Apple Silicon playback libraries. It excludes account data, private signing keys, local configuration and build caches.

Alternatively restore the Mac source archive from build 155, then apply `Mira-macOS-changes-from-155.patch`. The patch was checked by applying it to the build 155 files and comparing all modified source files. Restored upstream LFS libraries are excluded from the text patch. Use `scripts/fetch-macos-runtime.py x86_64` from the upstream Git checkout to fetch them.

Mac 163 is 0.5.18. iPhone 161 and Fire TV 162 retain their existing independent versions. See `VALIDATION.md` for tests and limitations.
