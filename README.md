# nodaysidle Halide — Omarchy Theme

**nodaysidle Halide** is the anti-thesis of every rounded-glass theme in the portfolio. No squircle, no gradient, no glow, no blur. It is a photographic darkroom instrument panel: neutral cold greys, hard 1px rules, and exactly one colour allowed to exist — a chartreuse safelight. Everything else is silver and soot.

![Halide Preview](preview.png)

## Design Philosophy

- **Colour logic**: The base `#0B0C0D` is a true neutral, not a blue-black. Most "dark themes" secretly put blue in the background and the eye pays for it all day; Halide refuses. Text is paper `#E6E8E6` with a faint green cast so it sits next to the lime without clashing. Silver `#C6CED1` is structure (frames, groupbars, dividers). Lime `#A9E34B` is a *signal only*: active workspace, cursor block, focused control, success. It never touches a window frame — that rule is what keeps the theme brutalist instead of video-game.
- **Borders**: Exactly 1px, flat silver (`#C6CED1`), no gradient and no animation. At `rounding = 2` and `rounding_power = 1.0` the corners are functionally square: a window is a plate of glass, not a card. Inactive border drops to `rgba(1E2224FF)` — almost invisible, so the screen reads as sheets in a lightbox rather than a fence of frames. `dim_inactive = 0.40` is used hard here: unfocused windows fall properly back, which is the whole point of a 1px structure. Shadow is on but tight and hard (`range = 10`, `render_power = 3`).
- **Bar**: 22px — the thinnest bar in the set. Flat `#0B0C0D` at full opacity, one 1px rule `#1E2224` beneath it, uppercase monospace clock with date. Workspaces render as two-digit numerals, not dots or pills. This is the "film strip" surface: information at maximum density and minimum decoration.
- **Motion**: Fast and mechanical. `shutter` curve `(0.2, 0.0, 0.0, 1.0)` at speed 8 for windows, 6 for window moves/workspaces, 3 for layers. Nothing eases softly, nothing overshoots — the frame cuts in like a shutter firing. Border angle animation stays off.

## Palette

| Token | Hex | Use |
| :--- | :--- | :--- |
| Darkroom Void | `#0B0C0D` | Primary background |
| Fixer Black | `#060708` | Popovers, lock, sunken |
| Plate Raise | `#16181A` | Cards, elevated surfaces |
| Rule Grey | `#1E2224` | Inactive borders, bar rule, dividing rules |
| Silver | `#C6CED1` | Active borders, structure, headings |
| Lime Safelight | `#A9E34B` | Signal only: active workspace, cursor, success |
| Halide Cyan | `#6FD3C7` | Info, secondary telemetry signal |
| Amber Stop | `#D9B451` | Warning |
| Oxide Red | `#E05F5F` | Error |
| Paper | `#E6E8E6` | Primary text |
| Fog | `#5F6668` | Muted labels, comments |

## File Structure

```
omarchy-theme-nodaysidle-halide/
├── backgrounds/
│   ├── 01-halide-darkroom-void.png
│   ├── 02-halide-safelight-slit.png
│   └── 03-halide-contact-sheet.png
├── hooks/
│   └── nodaysidle-halide
├── btop.theme
├── colors.toml
├── ghostty.conf
├── gtk.css
├── gtk3.css
├── gum.env.conf
├── hyprland.lua
├── hyprlock.conf
├── install
├── preview.png
├── shell.toml
└── uninstall
```

## Terminal Environment: Ghostty & Herdr

Halide is strictly configured for a **Ghostty** + **Herdr** workflow:
- **Ghostty**: Directly configured via `ghostty.conf` with `#0B0C0D` background, `#E6E8E6` paper foreground, `#A9E34B` lime block cursor, and custom ANSI palette.
- **Herdr**: Inherits Halide's live palette via `theme = "Omarchy"` (GPUI) and `theme.name = "terminal"` (TUI multiplexer), syncing active session telemetry seamlessly.

## Installation & Activation

```bash
# Link theme and install hooks
cd ~/dev/nodaysidle/omarchy-theme-nodaysidle-halide
./install

# Apply theme
omarchy theme set nodaysidle-halide
```

To remove:
```bash
./uninstall
```
