-- vim_nav — Neovim side of seamless Ctrl+h/j/k/l navigation in Rex
--
-- Moves between Neovim splits, and at a split edge runs `rex focus` so focus
-- crosses into the neighbouring Rex pane. Pairs with ../vim_nav.lua, which
-- hands these keys to Neovim instead of moving Rex focus.
--
-- Loaded by nvim's lua/plugins/tmux.lua after the herdr script. It only takes
-- over when Rex is the innermost multiplexer: inside a herdr or tmux pane that
-- runs in Rex, $REX_BLOCK is inherited too, and their navigation must win.

if not vim.env.REX_BLOCK or vim.env.REX_BLOCK == "" then
	return
end
if (vim.env.HERDR_PANE_ID or "") ~= "" or (vim.env.TMUX or "") ~= "" then
	return
end

-- Rex puts its own `rex` first on PATH, but a shell that rebuilds PATH can lose
-- it, so prefer the binary that matches the server.
local rex_bin = (vim.env.REX_BIN_DIR and vim.env.REX_BIN_DIR ~= "") and (vim.env.REX_BIN_DIR .. "/rex") or "rex"

local function nav(wincmd, dir)
	local prev = vim.api.nvim_get_current_win()
	vim.cmd("wincmd " .. wincmd)
	if vim.api.nvim_get_current_win() ~= prev then
		return -- moved within Neovim
	end
	-- At a split edge: move Rex focus from this pane, which is the focused one.
	vim.system({ rex_bin, "focus", dir })
end

local function map(lhs, wincmd, dir, desc)
	vim.keymap.set("n", lhs, function()
		nav(wincmd, dir)
	end, { silent = true, noremap = true, desc = desc })
end

map("<C-h>", "h", "left", "Navigate left (vim/rex)")
map("<C-j>", "j", "down", "Navigate down (vim/rex)")
map("<C-k>", "k", "up", "Navigate up (vim/rex)")
map("<C-l>", "l", "right", "Navigate right (vim/rex)")
