local beautiful = require("beautiful")
local gears = require("gears")

-- beautiful.init();
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

beautiful.useless_gap = 4

beautiful.font = "JetBrainsMono Nerd Font 14"

beautiful.bg_normal = "#1e1e2e"
