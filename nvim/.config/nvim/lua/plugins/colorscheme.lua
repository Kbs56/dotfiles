-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	config = function()
-- 		require("kanagawa").setup({
-- 			compile = true,
-- 		})
-- 		vim.cmd("colorscheme kanagawa")
-- 	end,
-- 	build = function()
-- 		vim.cmd("KanagawaCompile")
-- 	end,
-- }

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
