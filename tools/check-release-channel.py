#!/usr/bin/env python3
"""Read-only audit of the public, shared Mira update channel. Requires gh login."""
import json
import re
import subprocess
import tempfile
import hashlib
import plistlib
import zipfile
from pathlib import Path

REPO = "4marawan001/Mira"


def gh(*args):
    return subprocess.check_output(["gh", *args], text=True)


def api(path):
    return json.loads(gh("api", path))


def verify_artifact(artifact, releases):
    match = re.fullmatch(
        r"https://github\.com/4marawan001/Mira/releases/download/([^/?#]+)/([^/?#]+)",
        artifact["url"],
    )
    assert match and ".." not in artifact["url"], "Untrusted artifact location"
    tag, name = match.groups()
    if tag not in releases:
        releases[tag] = api(f"repos/{REPO}/releases/tags/{tag}")
    release = releases[tag]
    assert not release["draft"] and not release["prerelease"], "Artifact must be published/stable"
    asset = next(a for a in release["assets"] if a["name"] == name)
    assert re.fullmatch(r"[0-9a-f]{64}", artifact["sha256"]), "Invalid checksum"
    assert asset["digest"] == "sha256:" + artifact["sha256"], f"Checksum mismatch: {name}"
    assert asset["size"] == artifact["size"] > 0, f"Size mismatch: {name}"
    assert isinstance(artifact["build"], int) and artifact["build"] > 0
    assert artifact["version"].strip()
    for child in artifact.get("architectures", {}).values():
        verify_artifact(child, releases)
        assert child["build"] == artifact["build"] and child["version"] == artifact["version"]


def main():
    latest = api(f"repos/{REPO}/releases/latest")
    names = {a["name"] for a in latest["assets"]}
    assert "mira-updates.json" in names, "Latest release has no shared update feed"
    with tempfile.TemporaryDirectory() as folder:
        gh("release", "download", latest["tag_name"], "--repo", REPO,
           "--pattern", "mira-updates.json", "--dir", folder)
        feed = json.loads((Path(folder) / "mira-updates.json").read_text())
    assert feed["schema"] == 1
    releases = {latest["tag_name"]: latest}
    for platform in ("ios", "macos", "firetv"):
        artifact = feed["artifacts"][platform]
        verify_artifact(artifact, releases)
        print(f"Verified {platform}: {artifact['version']} / {artifact['build']}")
    # Asset labels and even valid checksums cannot prove the app's internal version.
    ios = feed["artifacts"]["ios"]
    tag, name = ios["url"].rsplit("/", 2)[-2:]
    with tempfile.TemporaryDirectory() as folder:
        gh("release", "download", tag, "--repo", REPO, "--pattern", name, "--dir", folder)
        package = Path(folder) / name
        assert hashlib.sha256(package.read_bytes()).hexdigest() == ios["sha256"]
        with zipfile.ZipFile(package) as archive:
            entries = [n for n in archive.namelist() if len(n.split("/")) == 3
                       and n.startswith("Payload/") and n.endswith(".app/Info.plist")]
            assert len(entries) == 1, "Ambiguous IPA app identity"
            assert archive.getinfo(entries[0]).file_size < 4 * 1024 * 1024
            info = plistlib.loads(archive.read(entries[0]))
            assert info["CFBundleIdentifier"] == "com.nuvio.media", "Wrong iPhone app"
            assert str(info["CFBundleVersion"]) == str(ios["build"]), "IPA build number mismatch"
            assert info["CFBundleShortVersionString"] == ios["version"], "IPA version mismatch"
    print("Verified iPhone internal bundle identity and version")
    tv = feed["artifacts"]["firetv"]
    assert tv["url"].split("/")[-2] == latest["tag_name"], "Latest must contain the current TV APK"
    assert tv["url"].split("/")[-1] in names, "Latest TV asset is missing"
    print("Shared update channel is valid:", latest["tag_name"])


if __name__ == "__main__":
    main()
