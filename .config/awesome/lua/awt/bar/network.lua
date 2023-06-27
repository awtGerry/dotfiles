local wibox = require("wibox")

local net = wibox.widget.textbox()
net.align = "right"

local function get_network(widget)
    local str;

    local ethernet = io.popen("nmcli device status | grep ethernet | awk '{print $3}'")
    local ethernet_status = ethernet:read("*all")
    ethernet:close()

    if string.find(ethernet_status, "connected") then
        local ethernet = io.popen("nmcli device status | grep ethernet | awk '{print $1}'")
        local ethernet_name = ethernet:read("*all")
        ethernet:close()
        str = "󰈀  " .. ethernet_name
    else -- TODO: checar si funciona bien con wifi
        local wifi = io.popen("nmcli -t -f active,ssid dev wifi | grep yes | cut -c -3")
        local wifi_status = wifi:read("*all")
        wifi:close()
        if string.find(wifi_status, "yes") then
            local con = io.popen("nmcli -t -f active,ssid dev wifi | grep yes | cut -c 5-")
            local conname = con:read("*all")
            conname:close()
            str = "󰤨 " .. conname
        else
            str = "󰤭 "
        end
    end

    widget:set_markup(str)
end

get_network(net)

return net
