#!/usr/bin/env bash
# Release the UI: test, build, zip dist, tag, and attach dist.zip to a GitHub release.
#   scripts/release.sh v0.2.1
# (scripts/release-workflow.yml.txt is the same as an Actions workflow, for a token with the
# `workflow` scope: move it to .github/workflows/release.yml.)
set -euo pipefail
V="${1:?usage: scripts/release.sh vX.Y.Z}"
cd "$(dirname "$0")/.."
bun install --frozen-lockfile >/dev/null
bun test
VITE_UI_VERSION="$V" bun run build
rm -f dist.zip && (cd dist && zip -qr ../dist.zip .)
git tag "$V" && git push -q origin "$V"
gh release create "$V" dist.zip --title "$V" --notes "UI build $V. In the add-on: ui_version $V (or latest), then restart."
