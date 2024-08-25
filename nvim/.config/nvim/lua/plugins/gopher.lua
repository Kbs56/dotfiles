return {
  {
    "olexsmir/gopher.nvim",
    requires = { -- dependencies
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      vim.keymap.set('n', '<leader>gj', '<cmd> GoTagAdd json <CR>')
    end
  }
}
