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

    -- Override colors with violet shades
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#8e44ad" }) -- deep violet
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#9b59b6" }) -- medium violet
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#a569bd" }) -- soft violet
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#bb8fce" }) -- pastel violet
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#d2b4de" }) -- light violet
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#e8daef" }) -- very light violet
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#7d3c98" }) -- dark violet
  end,
}
