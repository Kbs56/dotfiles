return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	lazy = false,
	opts = {
		lazy_sync = true,
	},
	keys = {
		{
			"<leader>pf",
			function()
				require("fff").find_files()
			end,
			desc = "Find files",
		},
		{
			"<C-p>",
			function()
				require("fff").find_files()
			end,
			desc = "Find files",
		},
		{
			"<leader>ff",
			function()
				require("fff").find_files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fg",
			function()
				require("fff").live_grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>fs",
			function()
				require("fff").live_grep_under_cursor()
			end,
			mode = { "n", "x" },
			desc = "Grep word/selection",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.lines()
			end,
			desc = "Search current buffer",
		},
	},
}
