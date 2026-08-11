local current = vim.api.nvim_get_hl(0, { name = "@keyword" })
current.italic = false
vim.api.nvim_set_hl(0, "@keyword", current)

vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#ff3440" }) -- deep violet
vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = "#dd5555" }) -- deep violet
-- vim.api.nvim_set_hl(0, "@keyword.control.conditional", { fg = "#B7950B" }) -- deep violet
vim.api.nvim_set_hl(0, "@string", { fg = "#f49f73" }) -- deep violet
vim.api.nvim_set_hl(0, "@string_quotes", { fg = "#ff7868", bold = true }) -- deep violet
vim.api.nvim_set_hl(0, "@number", { fg = "#6fcd04" }) -- deep violet
vim.api.nvim_set_hl(0, "@boolean", { fg = "#62b404" }) -- deep violet
vim.api.nvim_set_hl(0, "@boolean.true", { fg = "#62b404" }) -- deep violet
vim.api.nvim_set_hl(0, "@boolean.false", { fg = "#609000" }) -- deep violet
vim.api.nvim_set_hl(0, "@variable.argument", { bold = true })
vim.api.nvim_set_hl(0, "@variable.local", { fg = "#bbbbbb" }) -- deep violet
vim.api.nvim_set_hl(0, "@variable.instance", { fg = "#bbbbff" }) -- deep violet
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
vim.api.nvim_set_hl(0, "@function_prototype.powerbuilder", { fg = current.fg, underline = true, force = true })

vim.api.nvim_set_hl(0, "@function.method.call", { fg = "#da76fe" })

--background: #1a1b26

-- Override colors with violet shades
vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#8877FF" })
vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#6655DD" })
vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#5544CC" })
vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#8877FF" })
vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#6655DD" })
vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#5544CC" })
vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#8877FF" })

vim.api.nvim_set_hl(0, "MatchParen", { bg = "#555555", bold = true })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#555555" })

-- local tmp = vim.api.nvim_get_hl(0, { name = "@type", link = nil })
--
-- vim.api.nvim_set_hl(0, "AerialClassIcon", { fg = tmp.fg })
-- vim.api.nvim_set_hl(0, "AerialClass", { fg = tmp.fg })
--
-- local tmp = vim.api.nvim_get_hl(0, { name = "@type", link = nil })
-- vim.api.nvim_set_hl(0, "AerialFile", { fg = tmp.fg })

-- vim.api.nvim_set_hl(0, "@ts.error", {
--   undercurl = true, -- включает волнистое подчеркивание
--   sp = "#ff7f7f", -- цвет волнистой линии
--   bg = "#ff3440", -- можно добавить, если хочешь ещё и цвет текста
-- })

-- Get current highlight settings for @keyword

--  Highlight
vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#005500" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#005500" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#005500" })
vim.api.nvim_set_hl(0, "keyword.return", { bg = "#ff3440" })

-- NeoTree PowerBuilder file name colors
vim.api.nvim_set_hl(0, "NeoTreeFileNamePBWin", { fg = "#AEA77A" })
vim.api.nvim_set_hl(0, "NeoTreeFileNamePBObj", { fg = "#779E7A" })
vim.api.nvim_set_hl(0, "NeoTreeFileNamePBData", { fg = "#AE9EA6" })
vim.api.nvim_set_hl(0, "NeoTreeFileNamePBApp", { fg = "#f9e2af" })
vim.api.nvim_set_hl(0, "NeoTreeFileNamePBMenu", { fg = "#54c5ac" })
vim.api.nvim_set_hl(0, "NeoTreeFileNamePBQuery", { fg = "#6c7086" })
vim.api.nvim_set_hl(0, "NeoTreeFileNamePBStruct", { fg = "#74c7ec" })
vim.api.nvim_set_hl(0, "NeoTreeFileNamePBProj", { fg = "#6c7086" })
vim.api.nvim_set_hl(0, "NeoTreeFileNamePBLib", { fg = "#f9e2af" })
vim.api.nvim_set_hl(0, "NeoTreeFileNamePBTarget", { fg = "#6c7086" })
vim.api.nvim_set_hl(0, "MiniIconsGrey", { fg = "#6c7086" })
vim.api.nvim_set_hl(0, "NeoTreeFileNamePBWork", { fg = "#74c7ec" })
vim.api.nvim_set_hl(0, "NeoTreeFileNamePBGroup", { fg = "#6c7086" })

-- NeoTree SQL file type color
vim.api.nvim_set_hl(0, "NeoTreeFileNameSql", { fg = "#5EB87A" })

-- NeoTree directory level gradient (10 levels)
vim.api.nvim_set_hl(0, "NeoTreeDirLevel1", { fg = "#7AA2F7" })
vim.api.nvim_set_hl(0, "NeoTreeDirLevel2", { fg = "#93B5F0" })
vim.api.nvim_set_hl(0, "NeoTreeDirLevel3", { fg = "#ACCAE9" })
vim.api.nvim_set_hl(0, "NeoTreeDirLevel4", { fg = "#C5DFE2" })
vim.api.nvim_set_hl(0, "NeoTreeDirLevel5", { fg = "#D9D4DB" })
vim.api.nvim_set_hl(0, "NeoTreeDirLevel6", { fg = "#E5D6D5" })
vim.api.nvim_set_hl(0, "NeoTreeDirLevel7", { fg = "#EFD8CE" })
vim.api.nvim_set_hl(0, "NeoTreeDirLevel8", { fg = "#F6D9C7" })
vim.api.nvim_set_hl(0, "NeoTreeDirLevel9", { fg = "#FBDAC0" })
vim.api.nvim_set_hl(0, "NeoTreeDirLevel10", { fg = "#FFDBC0" })
