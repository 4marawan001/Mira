# Reconstruct the latest Mira source

Download the source archive from https://github.com/4marawan001/Mira/releases/tag/v0.5.10 and the corresponding patch from this release. Base archive SHA-256 values are recorded in `Mira-source-deltas.json`.

## Mac Release 156

Extract `Mira-macOS-source.zip`, enter its `Mira-macOS` folder, and run:

```sh
git apply /path/to/Mira-macOS-changes-from-155.patch
```

## iPhone preview source

Extract `Mira-ios-source.zip`, enter its `Mira` folder, and run:

```sh
git apply /path/to/Mira-ios-preview-changes-from-155.patch
```

The released iPhone IPA is still build 155. Both patches were checked by applying them to the recorded base files and comparing the results with the working source. Original licenses and acknowledgements are in the base archives. The prior `MIRA_SOURCE_BASE.json` describes the base snapshot; `Mira-source-deltas.json` identifies this update.
