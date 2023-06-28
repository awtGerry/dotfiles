local wibox = require("wibox")
local awful = require("awful")

battery_widget = wibox.widget.textbox()
battery_widget:set_align("right")

local function battery_status(widget)
    local CHARGE = io.popen("cat /sys/class/power_supply/BAT0/capacity")
    local tmp_charge = CHARGE:read("*all")
    tmp_charge = string.format("% 3d", tmp_charge)
    CHARGE.close()

    local STATUS = io.popen("cat /sys/class/power_supply/BAT0/status")
    local tmp_status = STATUS:read("*all")
    STATUS.close() -- TODO: check why

    local str

    if string.find(tmp_status, "Charging") then
        str = "󱐋" .. tmp_charge .. "%"
    else
        if tonumber(tmp_charge) >= 0 and tonumber(tmp_charge) < 20 then
            str = " " .. tmp_charge .. "%"
        elseif tonumber(tmp_charge) >= 20 and tonumber(tmp_charge) < 40 then
            str = " " .. tmp_charge .. "%"
        elseif tonumber(tmp_charge) >= 40 and tonumber(tmp_charge) < 60 then
            str = " " .. tmp_charge .. "%"
        elseif tonumber(tmp_charge) >= 60 and tonumber(tmp_charge) < 80 then
            str = " " .. tmp_charge .. "%"
        elseif tonumber(tmp_charge) >= 80 then
            str = " " .. tmp_charge .. "%"
        end
    end
    widget:set_markup(str)
end

battery_status(battery_widget)

local mytimer = timer({ timeout = 30 })
mytimer:connect_signal("timeout", function () battery_status(battery_widget) end)
mytimer:start()
