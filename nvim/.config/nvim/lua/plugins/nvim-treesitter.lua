return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parsers = {
			"c",
			"eex",
			"elixir",
			"gleam",
			"heex",
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

		local filetypes = vim.list_extend(vim.deepcopy(parsers), {
			"eelixir",
		})

		local ft = vim.api.nvim_create_autocmd

		ft("FileType", {
			pattern = filetypes,
			callback = function()
				if not pcall(vim.treesitter.start) then
					return
				end
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
