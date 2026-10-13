# Reconstruct Mira source

Download the base source archives from https://github.com/4marawan001/Mira/releases/tag/v0.5.10 and the matching patches from this release. Base archive SHA-256 values are recorded in `Mira-source-deltas.json`.

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

Both patches were applied to the recorded base files and the results compared with the working source. Original licenses and acknowledgements are in the base archives. The iPhone IPA is Release 158; the Mac DMG remains Release 157 and is linked in the update manifest.
