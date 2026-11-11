#!/usr/bin/env bash
# Build dist/*.mrpack from pack/. Same entry point locally and in CI.
# Requires packwiz (see README).
#
#   ./build.sh            dev build:     IRC_mc<mc>_<date>_<commit>.mrpack
#   IRC_RELEASE=1 ./build.sh   release:  IRC_<version>_mc<mc>.mrpack
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v packwiz >/dev/null; then
  echo "error: packwiz is not installed. See the 'Building' section of README.md." >&2
  exit 1
fi

toml() { sed -n "s/^$1 = \"\(.*\)\"/\1/p" pack/pack.toml | head -1; }
version=$(toml version)
mc=$(toml minecraft)

if [ -n "${IRC_RELEASE:-}" ]; then
  name="IRC_${version}_mc${mc}.mrpack"
else
  commit=$(git rev-parse --short=7 HEAD 2>/dev/null || echo nogit)
  [ -z "$(git status --porcelain 2>/dev/null)" ] || commit="${commit}-dirty"
  name="IRC_mc${mc}_$(date -u +%F)_${commit}.mrpack"
fi

rm -rf dist
mkdir -p dist
(cd pack && packwiz refresh && packwiz mr export -o "../dist/$name")
echo "built dist/$name"
