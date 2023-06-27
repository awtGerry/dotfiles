local beautiful = require("beautiful")
local gears = require("gears")
local xresources = require("beautiful.xresources")
local gfs = require("gears.filesystem")
local dpi = xresources.apply_dpi
local themes_path = gfs.get_themes_dir()

local colors = require("lua.awt.themes.colors.mocha")

local theme = {}

-- Definir fuente
theme.font = "JetBrainsMono Nerd Font 14"

-- Definir colores
theme.fg_color      = colors.fg_color
theme.fg_focus      = colors.blue
theme.fg_urgent     = colors.pink_3

theme.bg_color      = colors.bg_color
theme.bg_color_2    = colors.bg_color_2
theme.bg_color_3    = colors.bg_color_3

theme.blue = colors.blue
theme.blue_2 = colors.blue_2
theme.blue_3 = colors.blue_3

theme.pink = colors.pink
theme.pink_2 = colors.pink_2
theme.pink_3 = colors.pink_3

theme.useless_gap = dpi(4)

theme.border_width = dpi(2)
theme.border_normal = colors.overlay1
theme.border_focus = colors.pink

-- theme.images = require("images")

-- theme.notification_icon             = theme.images.bell
theme.notification_font             = theme.font .. "12"
theme.notification_spacing          = dpi(theme.useless_gap)
-- theme.notification_border_radius    = dpi(theme.rounded)
theme.notification_border_width     = dpi(0)

-- beautiful.init();
beautiful.init(theme)
