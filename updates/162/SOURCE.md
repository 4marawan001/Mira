# Reconstruct Mira source (Build 162)

Download the base source archives from https://github.com/4marawan001/Mira/releases/tag/v0.5.10 and the matching patches from this release. Base archive SHA-256 values are recorded in `Mira-source-deltas.json`.

## Fire TV Release 162

Extract `Mira-FireTV-source.zip`, enter its `Mira-FireTV` folder, then run:

```sh
git apply /path/to/Mira-FireTV-changes-from-155.patch
```

## Mac Release 162

The complete Mac source snapshot is `Mira-macOS-source-162.zip`; it includes verified Intel and Apple Silicon playback libraries.

Alternatively, extract `Mira-macOS-source.zip`, enter its `Mira-macOS` folder, then run:

```sh
git apply /path/to/Mira-macOS-changes-from-155.patch
```

## iPhone Release 161

iPhone remains at Release 161 (0.5.16); refer to release 161 assets and patches.

All patches apply cleanly to the recorded base files. Original licenses and acknowledgements are in the base archives. Saved account data and private signing keys are excluded.
