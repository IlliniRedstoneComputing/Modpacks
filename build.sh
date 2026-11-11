#!/usr/bin/env bash
# Build dist/IRC-<version>.mrpack from pack/. Same entry point locally and in CI.
# Requires packwiz (see README).
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v packwiz >/dev/null; then
  echo "error: packwiz is not installed. See the 'Building' section of README.md." >&2
  exit 1
fi

mkdir -p dist
cd pack
packwiz refresh
packwiz mr export -o "../dist/IRC-$(sed -n 's/^version = "\(.*\)"/\1/p' pack.toml | head -1).mrpack"
