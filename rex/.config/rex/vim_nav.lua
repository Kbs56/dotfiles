-- vim_nav — Rex side of seamless Ctrl+h/j/k/l navigation
--
-- The Rex port of vim-tmux-navigator and of ~/dotfiles-work/herdr's
-- vim-herdr-navigation. Each key checks the focused terminal's foreground
-- process. If it is Vim/Neovim, the binding declines the key so Rex delivers it
-- to the editor, which moves between its own splits and runs `rex focus` at an
-- edge (see editor/nvim.lua). Anywhere else the key moves Rex's pane focus.

local M = {}

local terminal = "com.superlogical.terminal"

-- vim-tmux-navigator's matcher, ^g?(view|l?n?vim?x?)(diff)?$, split into steps
-- because Lua patterns have no alternation.
local function is_vim(name)
	if not name then
		return false
	end
	name = name:lower():gsub("^.*/", ""):gsub("^%-", "")
	name = name:gsub("^g", ""):gsub("diff$", "")
	return name == "view" or name:match("^l?n?vim?x?$") ~= nil
end

-- `name` is the executable's file name, which is not always the command
-- (Claude Code reports its version), so check argv0 as well.
local function vim_in_foreground(ctx)
	local p = rex.block.call(terminal, "process", { block_id = ctx.block_id })
	local fg = p and p.foreground
	return fg ~= nil and (is_vim(fg.name) or is_vim(fg.argv0))
end

function M.setup(keys)
	keys = keys or { h = "left", j = "down", k = "up", l = "right" }
	for key, direction in pairs(keys) do
		rex.bind("ctrl+" .. key, function(ctx)
			if vim_in_foreground(ctx) then
				return false -- unhandled, so the key goes to the editor
			end
			rex.session.focus_direction({ direction = direction })
			return true
		end)
	end
end

return M
