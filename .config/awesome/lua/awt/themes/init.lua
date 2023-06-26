local beautiful = require("beautiful")
local gears = require("gears")

-- beautiful.init();
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

beautiful.font = "JetBrainsMono Nerd Font 14"
