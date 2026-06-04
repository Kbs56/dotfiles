return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run the first available formatter
			javascript = { "oxfmt", "prettier", "prettierd", stop_after_first = true },
			javascriptreact = { "oxfmt", "prettier", "prettierd", stop_after_first = true },
			typescript = { "oxfmt", "prettier", "prettierd", stop_after_first = true },
			typescriptreact = { "oxfmt", "prettier", "prettierd", stop_after_first = true },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
