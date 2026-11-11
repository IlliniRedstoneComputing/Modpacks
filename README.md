# Modpacks

Collection of mods used for AMcD development on our Minecraft servers.

## Overview

Announcing the initial **modpack** for of AMcD (name subject to change). Any mod application (Curseforge, Modrinth, etc) may be used to your preference. A list of all of the jar files can be found **here**. The Github repo also includes a one-click modpack file for Modrinth (.mrpack). We are currently using version **1.21.8 Fabric**, but that is also subject to change.

## Essential
- Litematica
    - https://modrinth.com/mod/litematica
    - https://www.curseforge.com/minecraft/mc-mods/litematica
- Archive Downloader
    - https://modrinth.com/mod/archive-downloader
    - https://www.curseforge.com/minecraft/mc-mods/archive-downloader
## Recommended
- Axiom
    - https://modrinth.com/mod/axiom
    - https://www.curseforge.com/minecraft/mc-mods/axiomtool
- WorldEdit
    - https://modrinth.com/plugin/worldedit
    - https://www.curseforge.com/minecraft/mc-mods/worldedit
- Carpet
    - https://modrinth.com/mod/carpet
    - https://www.curseforge.com/minecraft/mc-mods/carpet
- Sodium
- Iris
- Lithium
- Modmenu
- Any other performance mods

## Resource Packs
- The MattPack
    - https://modrinth.com/resourcepack/mattpack/version/uLEFsJic
- Or Redstone Tweaks
    - https://modrinth.com/resourcepack/redstone-tweaks
- Black and White Lamp Pack
    - https://github.com/AdvancedMCDevices/Modpacks/blob/main/Resource%20Packs/Redstone%20Lamp%20Black%26White.zip

## Building the .mrpack

The modpack source lives in `pack/` as a [packwiz](https://packwiz.infra.link/) project (one small `.pw.toml` per mod). The `.mrpack` is **not** committed; it is built from that source, either by GitHub Actions or locally.

- **GitHub:** every push builds it as a downloadable artifact (dev name), and publishing a release builds the release-named file and attaches it to that release. Bump `version` in `pack/pack.toml` before releasing.
- **Locally:** install packwiz, then run `./build.sh`. The result is in `dist/`: `IRC_mc<mc>_<date>_<commit>.mrpack` for a dev build, or `IRC_<version>_mc<mc>.mrpack` with `IRC_RELEASE=1 ./build.sh`.

packwiz is not assumed to be installed. The recommended way to get it is the upstream installation guide (https://packwiz.infra.link/installation/), which provides prebuilt binaries; if you have a Go toolchain, `go install github.com/packwiz/packwiz@latest` also works.

Common tasks (run inside `pack/`):

- `packwiz update --all` — bump every mod to its latest compatible version
- `packwiz mr add <mod>` — add a mod from Modrinth
- `packwiz refresh` — rebuild the index after editing files by hand
