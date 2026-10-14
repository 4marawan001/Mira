# Reconstruct Mira source

Download the base source archives from https://github.com/4marawan001/Mira/releases/tag/v0.5.10 and the matching patches from this release. Base archive SHA-256 values are recorded in `Mira-source-deltas.json`.

## iPhone Release 161

Extract `Mira-ios-source.zip`, enter its `Mira` folder, then run:

```sh
git apply /path/to/Mira-ios-changes-from-155.patch
```

## Mac Release 157

Extract `Mira-macOS-source.zip`, enter its `Mira-macOS` folder, then run:

```sh
git apply /path/to/Mira-macOS-changes-from-155.patch
```

## Fire TV Release 160

Extract `Mira-FireTV-source.zip`, enter its `Mira` folder, then run:

```sh
git apply /path/to/Mira-FireTV-changes-from-155.patch
```

All patches apply cleanly to the recorded base source archives and have been verified with `git apply --check`. Original licenses and acknowledgements are in the base archives. The iPhone IPA is Release 161; the Fire TV APK remains Release 160 and the Mac DMG remains Release 157.

