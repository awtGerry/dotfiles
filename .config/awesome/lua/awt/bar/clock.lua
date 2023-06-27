local wibox = require("wibox")

local clock = wibox.widget {
        format = "<b>  %H:%M</b>",
        widget = wibox.widget.textclock,
}

return clock
