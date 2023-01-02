#!/usr/bin/env bash
set -euxo pipefail

# Assumes tags are vMAJOR.MINOR.PATCH
# vMAJOR and vMAJOR.MINOR tags will be kept in sync with the latest PATCH tag
tag=$(echo "$GITHUB_REF" | cut -d '/' -f 3)
_tag=$(echo "$tag" | cut -d 'v' -f 2)
major="$(echo "$_tag" | cut -d '.' -f 1)"
minor="$(echo "$_tag" | cut -d '.' -f 2)"

minor_tag="v$major.$minor"
git tag -d "$minor_tag" 2> /dev/null || true
git tag "$minor_tag" "$GITHUB_SHA"
git push origin --force "$minor_tag"

major_tag="v$major"
git tag -d "$major_tag" 2> /dev/null || true
git tag "$major_tag" "$GITHUB_SHA"
git push origin --force "$major_tag"
