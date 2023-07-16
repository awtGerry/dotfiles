local wibox = require("wibox")

-- local res = wibox.widget {
--         markup = " ",
--         widget = wibox.widget.textbox,
-- }

-- return res

res = wibox.widget.textbox()
res:set_align("center")

local function get_resources(widget)
    -- local f = io.popen("free -h | grep Mem | awk '{print $3}'")
    local free_mem = io.popen("free | grep Mem | awk '{print $3/$2 * 100.0}'")
    local str = free_mem:read("*all")
    free_mem:close()
    str = str:gsub("%s+", "")
    str = "󰍛 " .. math.floor(str) .. "%"

    local free_cpu = io.popen("top -bn1 | grep Cpu | awk '{print $2}'")
    local str2 = free_cpu:read("*all")
    free_cpu:close()
    str2 = str2:gsub("%s+", "")
    str2 = "󰻠  " .. math.floor(str2) .. "%"

    str = str2 .. "   " .. str

    widget:set_markup(str)
end

get_resources(res)

local res_timer = timer({timeout = 15})
res_timer:connect_signal("timeout", function() get_resources(res) end)
res_timer:start()
