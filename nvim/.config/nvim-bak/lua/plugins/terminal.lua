return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      vim.keymap.set('n', '<leader>t', vim.cmd.ToggleTerm),
      vim.keymap.set('t', '<leader><leader>', vim.cmd.ToggleTerm),
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]]),
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]]),
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]]),
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]]),
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]]),
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]]),
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]])
    },
  }
}
