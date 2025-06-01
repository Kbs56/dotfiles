vim.keymap.set("n", "-", "<cmd>Oil --float <CR>", { desc = "Open parent directory in Oil" })

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end)

vim.keymap.set("n", "<leader>fj", "<cmd>%!jq .<CR>")

vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>")

vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open diagnostics in float" })

vim.keymap.set("n", "<leader>on", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")

vim.keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")

-- move file in current buffer to zettelkasten folder
vim.keymap.set(
	"n",
	"<leader>ok",
	":!mv '%:p' /Users/kennysheldon/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Kennys\\ Vault/Kennys\\ Notes/zettelkasten<cr>:bd<cr><cr>"
)

-- delete file in current buffer
vim.keymap.set("n", "<leader>odd", ":!rm '%:p'<cr>:bd<cr><cr>")

-- search for files in full vault
vim.keymap.set(
	"n",
	"<leader>os",
	':Telescope find_files search_dirs={"/Users/kennysheldon/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Kennys\\ Vault/Kennys\\ Notes"}<cr>'
)
vim.keymap.set(
	"n",
	"<leader>oz",
	':Telescope live_grep search_dirs={"/Users/kennysheldon/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Kennys\\ Vault/Kennys\\ Notes"}<cr>'
)

vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
