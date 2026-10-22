-- Rex config, ported from herdr (~/dotfiles-work/herdr) and tmux
-- (~/dotfiles/tmux). Ctrl+Space is the prefix, as in both. herdr tabs are Rex
-- tabs, and herdr workspaces are Rex sessions.
--
--   rex config check    validate without loading
--   rex config reload   apply (Rex doesn't watch this file)
--   rex keymap          show what the running server loaded

local prefix = "ctrl+space"

local function p(key)
	return prefix .. ">" .. key
end

local directions = { h = "left", j = "down", k = "up", l = "right" }

-- Prefix twice sends one to the terminal (tmux's send-prefix)
rex.bind(p(prefix), "pane.send_key", { key = prefix })

-- Ctrl+h/j/k/l moves across Neovim splits and Rex panes alike
require("vim_nav").setup()

-- Tabs
rex.bind(p("c"), "client.tab.new")
rex.bind(p("n"), "client.tab.next")
rex.bind(p("p"), "client.tab.previous")
rex.bind("alt+shift+l", "client.tab.next")
rex.bind("alt+shift+h", "client.tab.previous")
rex.bind(p("shift+."), "client.tab.move.forward") -- prefix+>
rex.bind(p("shift+,"), "client.tab.move.backward") -- prefix+<
rex.bind(p("shift+t"), "client.tab.rename")
rex.bind(p("shift+x"), "client.tab.close")
for i = 1, 9 do
	rex.bind(p(tostring(i)), "client.tab.goto", { index = i })
end

-- Panes. Splits open in the current pane's directory.
rex.bind(p("v"), "pane.split", { direction = "right" })
rex.bind(p("shift+5"), "pane.split", { direction = "right" }) -- prefix+%
rex.bind(p("-"), "pane.split", { direction = "down" })
rex.bind(p("shift+'"), "pane.split", { direction = "down" }) -- prefix+"
for key, direction in pairs(directions) do
	rex.bind(p(key), "pane.focus", { direction = direction })
	rex.bind(p("shift+" .. key), "pane.move", { direction = direction })
end
rex.bind(p("tab"), "pane.focus_next")
rex.bind(p("shift+tab"), "pane.focus_previous")
rex.bind(p("x"), "pane.close")
rex.bind(p("z"), "pane.zoom")

-- Resize mode: h/j/k/l or arrows, = to balance, Enter or Escape to leave
rex.mode("resize", { exclusive = true })
rex.bind(p("r"), "client.mode.enter", { name = "resize" })
for key, direction in pairs(directions) do
	rex.bind("resize/" .. key, "pane.resize", { direction = direction })
	rex.bind("resize/" .. direction, "pane.resize", { direction = direction })
end
rex.bind("resize/=", "pane.balance")
rex.bind("resize/enter", "client.mode.exit")

-- Sessions
rex.bind(p("w"), "session.switch")
rex.bind(p("shift+n"), "session.new")
rex.bind(p("shift+w"), "session.rename")
rex.bind(p("shift+d"), "session.close")

-- Navigate mode, herdr's prefix+g: j/k step through sessions, h/l through
-- panes. Unlike herdr's sidebar cursor, each step switches right away.
rex.mode("navigate", { exclusive = true })
rex.bind(p("g"), "client.mode.enter", { name = "navigate" })
rex.bind("navigate/j", "session.next")
rex.bind("navigate/k", "session.previous")
rex.bind("navigate/h", "pane.focus", { direction = "left" })
rex.bind("navigate/l", "pane.focus", { direction = "right" })
rex.bind("navigate/enter", "client.mode.exit")

-- App
rex.bind(p("b"), "client.sidebar.toggle")
rex.bind(p("s"), "client.settings")
rex.bind(p("shift+/"), "client.palette.toggle") -- prefix+?
rex.bind(p("shift+r"), "client.config.reload")
