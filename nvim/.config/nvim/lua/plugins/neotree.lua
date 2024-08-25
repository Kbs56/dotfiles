return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      enable_git_status = true,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          never_show = {
            ".git"
          }
        },
        hijack_netrw_behavior = "disabled"
      }
    })
  end
}
