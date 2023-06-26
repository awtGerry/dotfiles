local wibox = require("wibox")
local awful = require("awful")

volume_widget = wibox.widget.textbox()
volume_widget:set_align("right")

function update_volume(widget)
    local fd = io.popen("amixer sget Master")
    local status = fd:read("*all")
    fd:close()

    local volume = string.match(status, "(%d?%d?%d)%%")
    volume = string.format("% 3d", volume)

    status = string.match(status, "%[(o[^%]]*)%]")

    if string.find(status, "on", 1, true) then
        if tonumber(volume) >= 0 and tonumber(volume) < 25 then
            volume = "󰕿 " .. volume .. "%"
        elseif tonumber(volume) >= 25 and tonumber(volume) < 50 then
            volume = "󰖀 " .. volume .. "%"
        elseif tonumber(volume) >= 50 then
            volume = " " .. volume .. "%"
        end

    else
        volume = "󰖁"
    end
    widget:set_markup(volume)
end

update_volume(volume_widget)

mytimer = timer({ timeout = 0.2 })
mytimer:connect_signal("timeout", function () update_volume(volume_widget) end)
mytimer:start()
