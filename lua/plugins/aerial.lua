return {
  "stevearc/aerial.nvim",
  opts = function()
    local opts = {
      attach_mode = "global",
      show_guides = true,
      filter_kind = false,
      open_automatic = false,
      autojump = true,
      post_jump_cmd = "normal! zz",
    }

    return opts
  end,

  keys = {
    { "<leader>o", "<cmd>AerialToggle<CR>", desc = "Toggle Aerial outline" },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
