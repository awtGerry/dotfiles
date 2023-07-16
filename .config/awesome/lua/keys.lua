local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")

local rofi = "rofi -show drun -theme ~/.config/rofi/config.rasi"

awful.mouse.append_global_mousebindings({
    awful.button({ }, 3, function () awful.spawn(rofi) end),
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext),
})

-- General Awesome keys
awful.keyboard.append_global_keybindings({
    awful.key(
        {modkey}, "s", hotkeys_popup.show_help,
        {description="show help", group="awesome"}),
    awful.key(
        {modkey, "Shift"}, "w", function () mymainmenu:show() end,
        {description = "show main menu", group = "awesome"}),
    awful.key(
        {modkey, "Control"}, "r", awesome.restart,
        {description = "reload awesome", group = "awesome"}),
    awful.key(
        {modkey, "Control"}, "q", awesome.quit,
        {description = "quit awesome", group = "awesome"}),
    awful.key(
        {modkey}, "Return", function () awful.spawn(usr_default.TERMINAL) end,
        {description = "abre terminal", group = "programas"}),
    awful.key(
        {modkey,}, "p", function () awful.spawn(rofi) end,
        {description = "abre menu", group = "programas"}),
    awful.key(
        {modkey, "Shift"}, "p", function () awful.spawn("rofi -modi emoji -show emoji") end,
        {description = "abre menu", group = "programas"}),
    awful.key(
        {modkey}, "w", function () awful.spawn(usr_default.BROWSER) end,
        {description = "abre navegador", group = "programas"}),
    awful.key(
        {modkey}, "r", function () awful.spawn(usr_default.TERMINAL .. " -e ranger") end,
        {description = "abre ranger", group = "programas"}),
    awful.key(
        {modkey, "Shift"}, "r", function () awful.spawn(usr_default.FILE_MANAGER) end,
        {description = "abre explorador de archivos", group = "programas"}),
    awful.key(
        {modkey}, "m", function () awful.spawn(usr_default.MUSIC) end,
        {description = "abre " .. usr_default.MUSIC, group = "programas"}),
    awful.key(
        {modkey, "Shift"}, "m", function () awful.spawn(usr_default.TERMINAL .. " -e pulsemixer") end,
        {description = "abre manejador de audio", group = "programas"}),
    awful.key(
        {modkey}, "BackSpace", function () awful.spawn("wlogout -p layer-shell") end,
        {description = "abre logout menu", group = "programas"}),
    awful.key(
        {modkey}, "Print", function() awful.util.spawn("/home/gerry/.local/bin/awt --maim") end,
        {description = "screenshot", group = "control"}),
})

-- Multimedia
awful.keyboard.append_global_keybindings({
    awful.key({}, "XF86MonBrightnessUp",  function()
        awful.spawn("brightnessctl set 5%+ -q", false)
    end,
    {description = "increase brightness", group = "control"}),


    awful.key({}, "XF86MonBrightnessDown", function()
        awful.spawn("brightnessctl set 5%- -q", false)
    end,
    {description = "decrease brightness", group = "control"}),


    awful.key(
        {}, "Print", function() awful.util.spawn("maim -q -d 0.2 /home/gerry/Pictures/screenshots/full/screenshot") end,
        {description = "screenshot", group = "control"}),


    awful.key({}, "XF86AudioRaiseVolume",
        function() awful.spawn("pamixer -i 5 --allow-boost", false)
    end,
    {description = "increase volume", group = "control"}),


    awful.key({}, "XF86AudioLowerVolume",
        function() awful.spawn("pamixer -d 5 --allow-boost", false)
    end,
    {description = "decrease volume", group = "control"}),


    awful.key({}, "XF86AudioMute", function() 
        awful.spawn("pamixer -t", false)
    end,
    {description = "mute volume", group = "control"}),


    awful.key({modkey }, "F2", function() 
        misc.musicMenu()
    end,
    {description = "music menu", group = "control"}),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
    awful.key(
        {modkey}, "Left", awful.tag.viewprev,
        {description = "view previous", group = "tag"}),
    awful.key(
        {modkey}, "Right",  awful.tag.viewnext,
        {description = "view next", group = "tag"}),
    awful.key(
        {modkey}, "Tab", awful.tag.history.restore,
        {description = "go back", group = "tag"}),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key(
        {modkey}, "j", function () awful.client.focus.byidx( 1) end,
        {description = "focus next by index", group = "client"}),
    awful.key(
        {modkey}, "k", function () awful.client.focus.byidx(-1) end,
        {description = "focus previous by index", group = "client"}),
    awful.key(
        {modkey, "Control"}, "j", function () awful.screen.focus_relative( 1) end,
        {description = "focus the next screen", group = "screen"}),
    awful.key(
        {modkey, "Control"}, "k", function () awful.screen.focus_relative(-1) end,
        {description = "focus the previous screen", group = "screen"}),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key(
        {modkey, "Shift"}, "j", function () awful.client.swap.byidx(1) end,
        {description = "swap with next client by index", group = "client"}),
    awful.key(
        {modkey, "Shift"}, "k", function () awful.client.swap.byidx(-1) end,
        {description = "swap with previous client by index", group = "client"}),
    awful.key(
        {modkey}, "u", awful.client.urgent.jumpto,
        {description = "jump to urgent client", group = "client"}),
    awful.key(
        {modkey}, "l", function () awful.tag.incmwfact(0.05) end,
        {description = "increase master width factor", group = "layout"}),
    awful.key(
        {modkey}, "h", function () awful.tag.incmwfact(-0.05) end,
        {description = "decrease master width factor", group = "layout"}),
    awful.key(
        {modkey}, "space", function () awful.layout.inc(1) end,
        {description = "select next", group = "layout"}),
    awful.key(
        {modkey, "Shift"}, "space", function () awful.layout.inc(-1) end,
        {description = "select previous", group = "layout"}),
})


awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control" },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numpad",
        description = "select layout directly",
        group       = "layout",
        on_press    = function (index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end,
    },
})

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ modkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key(
            {modkey}, "f", function (c) c.fullscreen = not c.fullscreen c:raise() end,
            {description = "toggle fullscreen", group = "client"}),
        awful.key(
            {modkey}, "q", function (c) c:kill() end,
            {description = "close", group = "client"}),
        awful.key(
            {modkey,"Control"}, "space", awful.client.floating.toggle,
            {description = "toggle floating", group = "client"}),
        awful.key(
            {modkey,"Control"}, "Return", function (c) c:swap(awful.client.getmaster()) end,
            {description = "move to master", group = "client"}),
        awful.key(
            {modkey}, "t", function (c) c.ontop = not c.ontop end,
            {description = "toggle keep on top", group = "client"}),
        awful.key(
            {modkey}, "n", function (c) c.minimized = true end,
            {description = "minimize", group = "client"}),
        awful.key(
            {modkey}, "m", function (c) c.maximized = not c.maximized c:raise() end,
            {description = "(un)maximize", group = "client"}),

    })
end)
