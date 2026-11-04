#!/usr/bin/env bash
# Upload the downloadable materials as GitHub Release assets.
#
# The files themselves are NOT committed: put them in ./materials/ (git-ignored),
# named as in the `asset` column of scripts/materials.tsv, then run:
#
#   scripts/upload-materials.sh            # uploads to release materials-v1
#   TAG=materials-v2 scripts/upload-materials.sh
#
# Existing assets with the same name are replaced (--clobber), so the
# download URLs used in the site stay the same:
#   https://github.com/giorgioarcara/gems-tests/releases/download/<TAG>/<asset>
set -euo pipefail

REPO="giorgioarcara/gems-tests"
TAG="${TAG:-materials-v1}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIR="$ROOT/materials"
TSV="$ROOT/scripts/materials.tsv"

if ! gh release view "$TAG" -R "$REPO" >/dev/null 2>&1; then
  gh release create "$TAG" -R "$REPO" \
    --title "GEMS materials" \
    --notes "Record forms, instructions, scoring sheets, R code and Shiny apps for GEMS, Tele-GEMS and Auto-GEMS (originally on OSF: 4t5a8, t3bma, fq8g7). Released under a Creative Commons licence. File list and descriptions: scripts/materials.tsv."
fi

files=()
while IFS=$'\t' read -r asset _guid _src _desc; do
  f="$DIR/$asset"
  [[ -f "$f" ]] || { echo "Missing: $f" >&2; exit 1; }
  files+=("$f")
done < <(tail -n +2 "$TSV")

gh release upload "$TAG" -R "$REPO" --clobber "${files[@]}"
echo "Uploaded ${#files[@]} assets to $REPO@$TAG"
