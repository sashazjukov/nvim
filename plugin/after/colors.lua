local current = vim.api.nvim_get_hl(0, { name = "@keyword" })
current.italic = false
vim.api.nvim_set_hl(0, "@keyword", current)

vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#ff3440" }) -- deep violet
vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = "#dd5555" }) -- deep violet
-- vim.api.nvim_set_hl(0, "@keyword.control.conditional", { fg = "#B7950B" }) -- deep violet
vim.api.nvim_set_hl(0, "@string", { fg = "#e48f53" }) -- deep violet
vim.api.nvim_set_hl(0, "@number", { fg = "#6fcd04" }) -- deep violet
vim.api.nvim_set_hl(0, "@boolean", { fg = "#62b404" }) -- deep violet
vim.api.nvim_set_hl(0, "@boolean.true", { fg = "#62b404" }) -- deep violet
vim.api.nvim_set_hl(0, "@boolean.false", { fg = "#609000" }) -- deep violet
vim.api.nvim_set_hl(0, "@keyword.object.powerbuilder", { fg = "#777777" })
vim.api.nvim_set_hl(0, "@punctuation.delimiter.sql", { fg = "#ff7777" })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#777777" })
vim.api.nvim_set_hl(0, "@punctuation.delimiter.powerbuilder", { fg = "#777777" })
vim.api.nvim_set_hl(0, "@keyword.directive", { fg = current.fg })

vim.api.nvim_set_hl(0, "@sql.parameter", { bg = "#2E3440" }) -- deep violet
vim.api.nvim_set_hl(0, "@keyword.sql", { fg = "#6666ff" })
vim.api.nvim_set_hl(0, "@operator.sql", { fg = "#ff3440" })
vim.api.nvim_set_hl(0, "@operator.powerbuilder", { fg = "#ff3440" })
vim.api.nvim_set_hl(0, "@keyword.update.sql", { fg = "#ff7777" })
vim.api.nvim_set_hl(0, "@function", { fg = "#da76fe" })
vim.api.nvim_set_hl(0, "@function_prototype.powerbuilder", { fg = current.fg, force = true })

vim.api.nvim_set_hl(0, "@variable.argument", { bold = true })
--background: #1a1b26

-- Override colors with violet shades
vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#B7950B" }) -- dark mustard yellow
vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#D4AC0D" }) -- rich golden yellow
vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#F1C40F" }) -- classic bright yellow
vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#F7DC6F" }) -- soft pastel yellow
vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#FCF3CF" }) -- very light warm yellow
vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#FEF9E7" }) -- nearly white yellow tint
vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#9A7D0A" }) -- deep olive-gold

vim.api.nvim_set_hl(0, "MatchParen", { bg = "#555555", bold = true })

-- local tmp = vim.api.nvim_get_hl(0, { name = "@type", link = nil })
--
-- vim.api.nvim_set_hl(0, "AerialClassIcon", { fg = tmp.fg })
-- vim.api.nvim_set_hl(0, "AerialClass", { fg = tmp.fg })
--
-- local tmp = vim.api.nvim_get_hl(0, { name = "@type", link = nil })
-- vim.api.nvim_set_hl(0, "AerialFile", { fg = tmp.fg })

-- vim.api.nvim_set_hl(0, "@ts.error", {
--     undercurl = true, -- включает волнистое подчеркивание
--     sp = "#ff7f7f",   -- цвет волнистой линии
--     -- fg = "#ff3440", -- можно добавить, если хочешь ещё и цвет текста
-- })

-- Get current highlight settings for @keyword

--  Highlight
vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#005500" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#005500" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#005500" })
vim.api.nvim_set_hl(0, "keyword.return", { bg = "#ff3440" })
