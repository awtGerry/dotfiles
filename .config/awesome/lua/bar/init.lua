local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local space = wibox.widget.textbox()
local space2 = wibox.widget.textbox()

local logo = require("lua.bar.logo")
local tags = require("lua.bar.tags")
local clock = require("lua.bar.calendar.clock")
local volume = require("lua.bar.volume.volume")
local resources = require("lua.bar.resources")
-- local battery = require("lua.bar.battery")
local network = require("lua.bar.network")
space:set_text(" ")
space2:set_text("   ")

local bar = function(s)
    local wbar = awful.wibar {
        position = "top",
        screen = s,
        fg = beautiful.blue,
        bg = beautiful.bg_color
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
                        -- battery_widget,
                        volume_widget,
                    },
                    space2,
                    {
                        layout = wibox.layout.align.horizontal,
                        clock,
                        space2,
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
