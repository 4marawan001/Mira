# Reconstruct Mira source

Download the base source archives from https://github.com/4marawan001/Mira/releases/tag/v0.5.10 and the matching patches from this release. Base archive SHA-256 values are recorded in `Mira-source-deltas.json`.

## Fire TV Release 159

Extract `Mira-FireTV-source.zip`, enter its `Mira-FireTV` folder, then run:

```sh
git apply /path/to/Mira-FireTV-changes-from-155.patch
```

## iPhone Release 158

Extract `Mira-ios-source.zip`, enter its `Mira` folder, then run:

```sh
git apply /path/to/Mira-ios-changes-from-155.patch
```

## Mac Release 157

Extract `Mira-macOS-source.zip`, enter its `Mira-macOS` folder, then run:

```sh
git apply /path/to/Mira-macOS-changes-from-155.patch
```

All patches apply cleanly to the recorded base files. Original licenses and acknowledgements are in the base archives. The Fire TV APK is Release 159 (0.5.14); the iPhone IPA remains Release 158 (0.5.13) and Mac DMG remains Release 157 (0.5.12).
