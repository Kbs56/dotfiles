local rex_nav = vim.fn.expand("~/.config/rex/editor/nvim.lua")

return {
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		init = function()
			vim.g.tmux_navigator_no_mappings = 1
		end,
	},
	{
		"paulbkim-dev/vim-herdr-navigation",
		lazy = false,
		config = function(plugin)
			dofile(plugin.dir .. "/editor/nvim.lua")

			if vim.fn.filereadable(rex_nav) == 1 then
				dofile(rex_nav)
			end
		end,
	},
}
