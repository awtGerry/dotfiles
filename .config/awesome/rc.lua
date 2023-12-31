-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Librerias
local awful = require("awful")
local beautiful = require("beautiful")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

awful.spawn.with_shell("~/.config/awesome/autostart.sh")

-- Modkey (Mod4 es tecla de Windows / Super)
modkey = "Mod4"

-- Programas por defecto
usr_default = {
    TERMINAL = "wezterm",
    EDITOR = "nvim",
    BROWSER = "brave",
    FILE_MANAGER = "thunar",
    MUSIC = "spotify",
}

require "lua.configs"
require "lua.keys"
require "lua.themes"
require "lua.error"

-- Bar
local bar = require "lua.bar"
awful.screen.connect_for_each_screen(function (s)
    bar(s)
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[2])
end)
