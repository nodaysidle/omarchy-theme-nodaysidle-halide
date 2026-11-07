-- nodaysidle Halide — Hyprland Configuration (Lua)
-- Darkroom instrument: 1px silver plate, square corners, zero decoration motion.

local active_border_color = "rgba(C6CED1FF)"
local inactive_border_color = "rgba(1E2224FF)"

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
    gaps_in = 4,
    gaps_out = { top = 2, right = 8, bottom = 8, left = 8 },
    border_size = 1,
  },

  group = {
    col = {
      border_active = "rgba(A9E34BFF)", -- lime is allowed on group focus only
      border_inactive = inactive_border_color,
      border_locked_active = "rgba(A9E34BFF)",
      border_locked_inactive = inactive_border_color,
    },
    groupbar = {
      col = {
        active = "rgba(C6CED133)",
        inactive = "rgba(0B0C0DFF)",
      },
      text_color = "rgb(C6CED1)",
      text_color_inactive = "rgba(95, 102, 104, 0.80)",
      blur = false,
      gradient_rounding = 0,
    },
  },

  decoration = {
    rounding = 2,
    rounding_power = 1.0, -- square plate, not a card

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    dim_inactive = true,
    dim_strength = 0.40, -- hard falloff: the lightbox discipline
    dim_special = 0.45,

    blur = { enabled = false },

    shadow = {
      enabled = true,
      range = 10,
      render_power = 3,
      color = "rgba(000000E6)",
      color_inactive = "rgba(00000099)",
    },
  },
})

hl.curve("shutter", { type = "bezier", points = { { 0.20, 0.0 }, { 0.0, 1.0 } } })
hl.curve("shutterOut", { type = "bezier", points = { { 0.40, 0.0 }, { 1.0, 1.0 } } })

hl.animation({ leaf = "borderangle", enabled = false })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 8.0, bezier = "shutter", style = "popin 96%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 6.0, bezier = "shutterOut", style = "popin 96%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 6.0, bezier = "shutter" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.0, bezier = "shutter", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3.0, bezier = "shutterOut", style = "fade" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6.0, bezier = "shutter", style = "slide" })

o.window({ tag = "terminal" }, { tag = "-default-opacity", opacity = "1.0 1.0" })
o.window({ tag = "default-opacity" }, { opacity = "1.0 1.0" })
o.window({ tag = "chromium-based-browser" }, { opacity = "1.0 1.0" })
o.window({ tag = "firefox-based-browser" }, { opacity = "1.0 1.0" })

hl.layer_rule({ match = { namespace = "^(omarchy-notifications|omarchy-osd|omarchy-reminders)$" }, blur = false })
