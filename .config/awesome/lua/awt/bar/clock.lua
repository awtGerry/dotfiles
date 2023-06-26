local wibox = require("wibox")

local clock = wibox.widget {
        format = " %H:%M",
        widget = wibox.widget.textclock,
}

return clock
