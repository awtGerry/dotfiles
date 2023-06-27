local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local space = wibox.widget.textbox()
local space2 = wibox.widget.textbox()

local logo = require("lua.awt.bar.logo")
local tags = require("lua.awt.bar.tags")
local clock = require("lua.awt.bar.clock")
local volume = require("lua.awt.bar.volume")
local resources = require("lua.awt.bar.resources")
local network = require("lua.awt.bar.network")
space:set_text("  ")
space2:set_text("       ")

local bar = function(s)
    local wbar = awful.wibar {
        position = "top",
        height = 34,
        screen = s,
        fg = "#f5c2e7",
        bg = beautiful.bg_normal
    }
    wbar:setup {
        {
            {
                layout = wibox.layout.align.horizontal,
                logo,
                {
                    layout = wibox.layout.align.horizontal,
                    tags(s),
                },
                {
                    layout = wibox.layout.align.horizontal,
                    {
                        layout = wibox.layout.align.horizontal,
                        network,
                        space2,
                        volume_widget,
                    },
                    space2,
                    {
                        layout = wibox.layout.align.horizontal,
                        clock,
                        space,
                    },
                }
            },
            widget = wibox.container.margin,
            right = 5,
            left = 5
        },
        {
            layout = wibox.container.place,
            halign = "center",
            res
        },
        layout = wibox.layout.stack,
    }
end

return bar
