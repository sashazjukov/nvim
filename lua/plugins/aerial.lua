return {
  "stevearc/aerial.nvim",
  opts = function()
    local opts = {
      attach_mode = "global",
      show_guides = true,
      filter_kind = false,
      open_automatic = false,
      autojump = true,
      post_jump_cmd = "normal! zt",
      disable_max_lines = 20000,
      diff_windows = true,
    }

    local hl = vim.api.nvim_set_hl
    local visual_bg = vim.api.nvim_get_hl(0, { name = "Visual", link = false }).bg
    hl(0, "AerialLine", { bg = visual_bg, bold = true })
    hl(0, "AerialFunctionIcon", { fg = "#aa99cc" })
    hl(0, "AerialFunction", { fg = "#aa99cc" })
    hl(0, "AerialEvent", { fg = "#eebbee" })
    hl(0, "AerialEventIcon", { fg = "#eebbee" })
    hl(0, "AerialClass", { fg = "#00bbbb" })
    hl(0, "AerialFile", { fg = "#33aa99" })
    hl(0, "AerialFileIcon", { fg = "#33aa99" })
    hl(0, "AerialField", { fg = "#996666" })

    -- vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#ff3440" }) -- deep violet
    -- local tmp = vim.api.nvim_get_hl(0, { name = "@keyword.return", link = nil })
    --
    -- vim.api.nvim_set_hl(0, "AerialClassIcon", { fg = tmp.fg })
    -- vim.api.nvim_set_hl(0, "AerialClass", { fg = tmp.fg })
    --
    -- local tmp = vim.api.nvim_get_hl(0, { name = "@type", link = nil })
    -- vim.api.nvim_set_hl(0, "AerialFile", { fg = tmp.fg })
    return opts
  end,

  keys = {
    { "<leader>oo", "<cmd>AerialToggle<CR>", desc = "Toggle Aerial outline" },
    {
      "<leader>os",
      function()
        require("aerial").snacks_picker()
      end,
      desc = "Aerial outline picker",
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
