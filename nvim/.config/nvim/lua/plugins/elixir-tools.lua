return {
	"elixir-tools/elixir-tools.nvim",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local elixir = require("elixir")
		local elixirls = require("elixir.elixirls")

		elixirls.on_attach = function(client, bufnr)
			vim.lsp.codelens.enable(true, { bufnr = bufnr })

			local add_user_cmd = vim.api.nvim_buf_create_user_command
			add_user_cmd(bufnr, "ElixirFromPipe", elixirls.from_pipe(client), {})
			add_user_cmd(bufnr, "ElixirToPipe", elixirls.to_pipe(client), {})
			add_user_cmd(bufnr, "ElixirRestart", elixirls.restart(client), {})
			add_user_cmd(bufnr, "ElixirExpandMacro", elixirls.expand_macro(client), { range = true })
			add_user_cmd(bufnr, "ElixirOutputPanel", function()
				elixirls.open_output_panel()
			end, {})
		end

		elixir.setup({
			nextls = {
				enable = false,
			},
			elixirls = {
				enable = true,
				cmd = vim.fn.stdpath("data") .. "/mason/bin/elixir-ls",
				settings = elixirls.settings({
					dialyzerEnabled = false,
					enableTestLenses = false,
				}),
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = bufnr, noremap = true })
					vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = bufnr, noremap = true })
					vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = bufnr, noremap = true })
				end,
			},
			projectionist = {
				enable = true,
			},
		})
	end,
}
