-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
-- widgets library
require("vicious")

---{{{ Autorun
	-- desktop
	-- awful.util.spawn("dbus-launch pcmanfm --desktop")
	-- volume
	awful.util.spawn_with_shell("if [[ `ps -A | grep volumeicon | awk '$4 ~ /volumeicon/ {print 1}'` != 1 ]]; then volumeicon &>/dev/null & fi")
	-- compisiting
	awful.util.spawn_with_shell("xcompmgr -cF &")
---}}}

-- theme
beautiful.init("/home/hoxnox/.config/awesome/themes/hoxnox.lua")

-- This is used later as the default terminal, editor, etc. to run.
terminal = "xterm"
browser = "chromium"
filemanager = "pcmanfm"
imcli = "pidgin"
emailcli = "thunderbird"
imageditor = "gimp"
imageviewer = "picasa"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

---{{{ Custom settings for apps
	-- сообщаем о floating-приложениях в одном месте
	-- класс приложения пожно получить утилитой xprop
	floatingapps = {
		"MPlayer",
		"Cairo-dock",
		"Exe",
		"com-eteks-sweethome3d-SweetHome3D",
		"sun-awt-X11-XFramePeer",
		"pinentry",
		"gimp",
		"keepassx",
		"Pidgin",
		"Skype",
		"Keepassx",
		"Transmission"
	}
	opacityapps = {
		"XTerm",
		"Gvim"
	}
---}}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
	{ "restart", awesome.restart },
	{ "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = {{ "browser", browser},
                                   { "file manager", filemanager },
                                   { "music", "exaile"},
                                   { "terminal", terminal },
                                   { "IM client", imcli },
                                   { "skype", "skype" },
                                   { "email client", emailcli },
                                   { "image viewer", imageviewer },
                                   { "image editor", imageditor },
                                   { "keepassx", "keepassx"},
                                   { "dropbox", "dropbox"},
                                   { "awesome", myawesomemenu, beautiful.awesome_icon }}
                        })
mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
	awful.layout.suit.floating,
	awful.layout.suit.tile,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.tile.left,
	awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.spiral,
	awful.layout.suit.spiral.dwindle,
	awful.layout.suit.max,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.magnifier
}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
	-- Each screen has its own tag table.
	tags[s] = awful.tag({ 1, 2, 3, 4, 5 }, s, awful.layout.suit.tile.right)
	awful.tag.setproperty(tags[s][1], "mwfact", 0.55)
	awful.tag.setproperty(tags[s][2], "mwfact", 0.55)
	awful.tag.setproperty(tags[s][3], "mwfact", 0.55)
	awful.tag.setproperty(tags[s][4], "mwfact", 0.55)
	awful.tag.setproperty(tags[s][5], "mwfact", 0.55)
end
-- }}}

-- {{{ separators and spaces
separator = widget({type="textbox", align="right"})
separator.text = '<span color="#333333">|</span>'
space = widget({type="textbox", align="right"})
space.text = " ";
-- }}}

-- {{{ Keyboard map indicator and changer
	mylswitcher = {}
	mylswitcher.layout = {"us", "ru"}
	mylswitcher.widget = widget({ type ="textbox", align="right" })
	mylswitcher.current = 1
	mylswitcher.widget.width = 22
	mylswitcher.widget.align = "center"
	mylswitcher.widget.text = " " .. mylswitcher.layout[mylswitcher.current] .. " "
	mylswitcher.switch = function()
		mylswitcher.current = mylswitcher.current % #(mylswitcher.layout) + 1
		local t = " " .. mylswitcher.layout[mylswitcher.current] .. " "
		mylswitcher.widget.text = t
		local fh = io.popen("xkb-switch -s " .. mylswitcher.layout[mylswitcher.current])
		io.close(fh)
	end
	-- Mouse bindings
	mylswitcher.widget:buttons(awful.util.table.join(
		awful.button({ }, 1, function () mylswitcher.switch() end)
	))
-- }}}

-- Initialize widget
memwidget = awful.widget.graph()
--memwidget = widget({type="textbox"})
-- Progressbar properties
memwidget:set_width(18)
memwidget:set_height(16)
-- memwidget:set_vertical(true)
memwidget:set_background_color("#333333")
memwidget:set_border_color("#0a0a0a")
memwidget:set_color("#A5A574")
-- memwidget:set_gradient_colors({ "#285577", "#285577", "#AEC6D8" })
-- Register widget
vicious.cache(vicious.widgets.mem)
vicious.register(memwidget, vicious.widgets.mem, "$1", 3)
awful.widget.layout.margins[memwidget.widget] = { top = 1, right = 3 }

-- Initialize widget
cpu1widget = awful.widget.graph()
-- Graph properties
cpu1widget:set_width(18)
cpu1widget:set_height(17)
cpu1widget:set_background_color("#333333")
cpu1widget:set_color("#AEC6D8")
cpu1widget:set_border_color("#0a0a0a")
--cpu1widget:set_gradient_colors({ "#285577", "#285577", "#AEC6D8" })
-- Register widget
vicious.register(cpu1widget, vicious.widgets.cpu, "$2", 3)
awful.widget.layout.margins[cpu1widget.widget] = { top = 1, left = 1 }

-- Initialize widget
cpu2widget = awful.widget.graph()
-- Graph properties
cpu2widget:set_width(18)
cpu2widget:set_height(17)
cpu2widget:set_background_color("#333333")
cpu2widget:set_color("#AEC6D8")
cpu2widget:set_border_color("#0a0a0a")
--cpu2widget:set_gradient_colors({ "#285577", "#285577", "#AEC6D8" })
-- Register widget
vicious.register(cpu2widget, vicious.widgets.cpu, "$3", 3)
awful.widget.layout.margins[cpu2widget.widget] = { top = 1, right = 3 }

-- Traffic widget
-- checkout active connection:
netwidget = {}
netwidget.widget = widget({type="textbox", align="right"})
netwidget.widget.text = "choose"
netwidget.interfaces = {"none", "eth0", "wlan0", "ppp0"}
netwidget.ifcolours = {"#ff0000","#00ff00", "#0000ff", "#AEC6D8"}
--netwidget.menu = awful.menu({items={}})
netwidget.current = 1
netwidget.switch = function(curr)
  if curr == 1 then
    netwidget.widget.text = "none"
    vicious.unregister(netwidget.widget, false)
    return
  end
  netwidget.current = curr
  netwidget.widget.fg = netwidget.ifcolours[curr]
  vicious.unregister(netwidget.widget, false)
  vicious.register(netwidget.widget, vicious.widgets.net,
    "<span color=\"#8B8B69\">⇓</span><span color=\""..netwidget.ifcolours[curr].."\">${"..netwidget.interfaces[curr].." rx_mb}</span> "..
    "<span color=\"#8B8B69\">⇑</span><span color=\""..netwidget.ifcolours[curr].."\">${"..netwidget.interfaces[curr].." tx_mb}</span>")
  vicious.force({netwidget.widget})
end
netwidget.menu = awful.menu(
  {items = {{"none",     function() netwidget.switch(1) netwidget.menu:hide() end},
            {"ethernet", function() netwidget.switch(2) netwidget.menu:hide() end},
            {"wifi",     function() netwidget.switch(3) netwidget.menu:hide() end},
            {"mobile",   function() netwidget.switch(4) netwidget.menu:hide() end}}})
netwidget.widget:buttons(awful.util.table.join(
    awful.button({ }, 1, function () netwidget.menu:toggle() end)
))
--netwidget.widget.bg = "#333333"
--netwidget.widget.border_width = 1
--netwidget.widget.border_color = "#0a0a0a"
-- Register widget
--vicious.register(netwidget.widget, vicious.widgets.net,
--	"⇩${"..netwidget.interfaces[netwidget.current].." rx_min}")
awful.widget.layout.margins[netwidget.widget] = { top = 1, right = 3 }

--{{{ Battery widget
batwidget = awful.widget.progressbar()
batwidget:set_width(10)
batwidget:set_height(17)
batwidget:set_vertical(true)
batwidget:set_background_color("#494B4F")
batwidget:set_border_color("#8B8B69")
batwidget:set_color("#627B8B")
--batwidget:set_gradient_colors({ "#285577", "#285577", "#AEC6D8" })
vicious.register(batwidget, vicious.widgets.bat, "$2", 61, "BAT0")
awful.widget.layout.margins[batwidget.widget] = { top = 1, right = 3 }
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if not c:isvisible() then
                                                  awful.tag.viewonly(c:tags()[1])
                                              end
                                              client.focus = c
                                              c:raise()
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        --mylayoutbox[s],
        s == 1 and mysystray or nil,
        mytextclock,
        separator,
        mylswitcher.widget,
        separator,
        netwidget.widget,
        batwidget.widget,
        memwidget.widget,
        cpu2widget.widget,
        cpu1widget.widget,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

--{{{ fake input
--{{{ sendkeys
local fakekeys = {}
function sendkey(codes, time)
    if type(codes) ~= "table" then codes = { codes } end
    local f = function()
      for i = 1, #codes do root.fake_input("key_press", codes[i]) end
      for i = #codes, 1, -1 do root.fake_input("key_release", codes[i]) end
      fakekeys[1]:stop()
      table.remove(fakekeys, 1)
    end
    local t = timer({ timeout = 0.1 })
    t:add_signal("timeout", f)
    t:start()
    table.insert(fakekeys, t)
end
--}}}

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",      function (c) c.minimized = not c.minimized    end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({"Control",}, "Shift_L", function () mylswitcher.switch() end),
        awful.key({}, "XF86AudioRaiseVolume", function () awful.util.spawn("amixer sset Master 2+") end),
        awful.key({}, "XF86AudioLowerVolume", function () awful.util.spawn("amixer sset Master 2-") end),
        awful.key({}, "XF86AudioMute", function () awful.util.spawn("amixer sset Master toggle") end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     size_hints_honor = false},
      callback = awful.client.setslave },
    { rule_any = { class = opacityapps },
      properties = { opacity = 0.8 } },
    { rule_any = { class = floatingapps },
      properties = { floating = true } },
    { rule = { class = "Pidgin" },
      properties = { tag = tags[1][5]} },
    { rule = { class = "Skype" },
      properties = { tag = tags[1][5] } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    if c.class == "Skype" or c.class == "Pidgin" or c.class == "MPlayer"
        or c.class == "gimp" then
            awful.titlebar.add(c, { modkey = modkey })
    end

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    --os.execute('echo "'..c.class..'" >>~/c_class')

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

