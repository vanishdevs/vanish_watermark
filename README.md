# Vanish Watermark

A lightweight NUI watermark overlay for FiveM. Optional pause-menu hiding, configurable logo, and a toggle command.

## Requirements

- ox_lib (ensure it starts before this resource)

## Installation

1. Copy the folder `vanish_watermark` into your server resources.
2. In `server.cfg` add:
   - `ensure ox_lib`
   - `ensure vanish_watermark`
3. Place your logo image in `web/` (default: `logo.png`).

## Configuration

Edit `shared/config.lua`. This file is loaded via ox_lib.

Options:

- `commandName`: Toggle command (default `watermark`).
- `defaultEnabled`: Whether watermark starts visible.
- `hideWhenPaused`: Hide while pause menu is open.
- `intervalMs`: Check interval in milliseconds.
- `logo`: `src`, `maxHeight`, `maxWidth`, and `position` (`top/right/bottom/left`).

## Usage

- In-game: run `/<commandName>` to toggle (default `/watermark`).
- Exports (client): `loadWatermark`, `showWatermark`, `hideWatermark`.

## Notes

- UI is vanilla JS; no jQuery required.
- Keep `web/` assets small to maintain NUI performance.
