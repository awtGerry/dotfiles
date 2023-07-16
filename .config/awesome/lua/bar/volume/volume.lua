local wibox = require("wibox")
local awful = require("awful")

volume_widget = wibox.widget.textbox()
volume_widget:set_align("right")

local function update_volume(widget)
    local volume = io.popen("pamixer --get-volume")
    local volume_level = volume:read("*all")
    volume:close()

    local volume_status = io.popen("pamixer --get-mute")
    local volume_mute = volume_status:read("*all")
    volume_status:close()

    volume_level = string.format("% 3d", volume_level)


    if string.find(volume_mute, "false") then
        if tonumber(volume_level) >= 0 and tonumber(volume_level) < 25 then
            volume_level = "󰕿 " .. volume_level .. "%"
        elseif tonumber(volume_level) >= 25 and tonumber(volume_level) < 50 then
            volume_level = "󰖀 " .. volume_level .. "%"
        elseif tonumber(volume_level) >= 50 then
            volume_level = "  " .. volume_level .. "%"
        end
    else
        volume_level = "󰖁 "
    end
    widget:set_markup(volume_level)
end

update_volume(volume_widget)

local mytimer = timer({ timeout = 1 })
mytimer:connect_signal("timeout", function () update_volume(volume_widget) end)
mytimer:start()
