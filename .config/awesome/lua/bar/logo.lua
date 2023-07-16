local awful = require("awful")
local wibox = require("wibox")

local msg =
[[
<span foreground="#04a5e5" size="x-large"> 󰏩  </span>
]]

local logo = wibox.widget {
    markup = msg,
    widget = wibox.widget.textbox,
}

logo:buttons(
    awful.util.table.join(
        awful.button({}, 1, function()
            awful.spawn("rofi -show drun")
    end))
)

return logo
