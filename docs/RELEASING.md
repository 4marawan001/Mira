# Build and publish Mira

Each platform has a separate source checkout and Release artifact. The public repository holds documentation, release metadata, source archives/patches, and the Mac iPhone-update helper. It is not a single directly buildable app source tree.

## Preserve existing installations

Keep iPhone `com.nuvio.media`, Mac `app.mira.desktop` and TV `app.mira.tv`. Retain the TV signing key and existing Sideloadly signing identity. Do not publish saved accounts, local properties, private provider URLs, signing keys or raw private logs.

Use a strictly increasing internal build number for every new package. Inspect the actual IPA `Payload/*.app/Info.plist`, Mac `Contents/Info.plist`, or APK manifest; a GitHub tag/title alone does not change the app version. Do not replace an already published binary under the same asset name.

## Before packaging

1. Read the local handoff and each checkout’s development instructions. Preserve unrelated working changes and the iPhone lookup feature.
2. Reuse installed JDK/SDK dependencies and caches. Avoid cleaning entire build trees for small edits.
3. Run relevant regression tests and review the real iPhone 12 mini preview before a final iPhone IPA. Use Debug/non-minified previews for TV iteration, then build optimized Release once.
4. Verify bundle IDs, internal versions, architectures, signatures, archive contents and SHA-256 hashes. Record physical-device checks separately from simulator/emulator checks.
5. Upload an explicit allowlist of public packages, source archives/patches, screenshots, checksums and notes. Screenshots must omit private account details and provider URLs.

## Shared update channel

Older TV builds read GitHub `releases/latest` and expect its APK. The iPhone helper and Mac checksum verification read `releases/latest/download/mira-updates.json`. Therefore the Latest release must contain the current TV APK and a complete manifest for **ios, macos and firetv**.

For an iPhone-only or Mac-only release, publish with **Latest disabled**. Fetch the live manifest immediately before changing it; preserve other platforms and their architecture entries. Verify each entry against its GitHub asset digest and size, then update the shared manifest on the current TV release. Never upload a stale manifest copied from an old output folder.

If Latest accidentally points at an IPA-only release, set the current TV release back to Latest and verify the shared URL. The new helper can fall back to a published manifest, but older installed apps still need the channel repaired.

Run this read-only check after publishing:

```sh
python3 tools/check-release-channel.py
```

It requires GitHub CLI (`gh`) authenticated to an account that can read the repository. It checks the shared feed, all platform asset hashes/sizes, Mac architecture entries, the Latest TV APK, and the iPhone IPA’s internal bundle ID/version/build. The IPA is downloaded temporarily and removed after the check. A [workflow template](../tools/check-update-channel.workflow.yml) is included. The current GitHub OAuth login lacks the workflow permission needed to install it under `.github/workflows`, so it is not enabled. Run the script manually for now. With a suitably authorized GitHub login, copy the template to `.github/workflows/check-update-channel.yml`; it reports failures and never alters releases.

## Update helper

The helper’s source is in `companion/`. On a Mac with Xcode command-line tools:

```sh
mkdir -p /tmp/mira-helper-tests
xcrun swiftc -parse-as-library -module-cache-path /tmp/mira-helper-tests/cache \
  companion/UpdateFeed.swift companion/FeedChecks.swift -o /tmp/mira-helper-tests/checks
/tmp/mira-helper-tests/checks
bash companion/build.sh /tmp/mira-helper-build
```

The output is a universal arm64/x86_64 app requiring macOS 13+. ZIP only the `.app`, not the compiler cache or intermediate architecture binaries. The helper verifies IPA downloads and opens Sideloadly; it does not install unsigned IPAs directly on iPhone.

## Documentation checks

After changing a guide, run `python3 tools/check-docs.py` from the repository root. It checks Markdown links, section anchors, image descriptions and the current package/badge references. Update those version assertions whenever the public channel changes. Keep technical reports in the docs index and the main README focused on downloads and the app.
