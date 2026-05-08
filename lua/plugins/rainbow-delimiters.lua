-- This module contains a number of default definitions
---@type rainbow_delimiters.config
return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")
    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
        powerbuilder = "rainbow-blocks",
      },
      priority = {
        [""] = 110,
        lua = 210,
      },
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        -- "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    }

    -- -- Override colors with violet shades
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#B7950B" })    -- dark mustard yellow
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#D4AC0D" }) -- rich golden yellow
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#F1C40F" })   -- classic bright yellow
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#F7DC6F" }) -- soft pastel yellow
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#FCF3CF" })  -- very light warm yellow
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#FEF9E7" }) -- nearly white yellow tint
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#9A7D0A" })   -- deep olive-gold
  end,
}
