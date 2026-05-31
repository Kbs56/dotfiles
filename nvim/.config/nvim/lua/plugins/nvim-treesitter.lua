return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parsers = {
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"javascript",
			"typescript",
			"tsx",
			"html",
		}

		require("nvim-treesitter").setup({
			ensure_installed = parsers,
		})

		local ft = vim.api.nvim_create_autocmd

		ft("FileType", {
			pattern = parsers,
			callback = function()
				vim.treesitter.start()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
