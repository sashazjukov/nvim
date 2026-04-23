-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--=[ Yank full path of current file ]=--
vim.keymap.set("n", "<f12>yp", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    print("Yanked path: " .. path)
end, { desc = "Yank full path of current file" })

--=[ Other usfull keymaps ]=--
vim.keymap.set({ "i" }, "jj", "<ESC>", { desc = "_ESC to Normal mode", silent = true })

vim.keymap.set("n", [[c]], [["_c]], { desc = "_Change without yanking" })
vim.keymap.set("n", [[""]], [["_ci"]], { desc = "_Change inside quotes" })
vim.keymap.set("n", [[vv]], [[viw]], { desc = "_Select current word" })
vim.keymap.set({ "v" }, "p", "pgvy", { desc = "_Past without yanking!" })

vim.keymap.set("n", "<A-d>", ":t.<CR>", { desc = "_duplicate line" })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "_ctrl+a and yank" })

vim.keymap.set("n", "<A-j>", "<cmd>cnext<CR>zz", { desc = "_Next quick seqrch" })
vim.keymap.set("n", "<A-k>", "<cmd>cprev<CR>zz", { desc = "_Prev quick seqrch" }) -- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

vim.keymap.set({ "n", "v" }, "<leader>dd", [["_d]], { desc = "_delete without yanking" })
vim.keymap.set(
    "n",
    "<F12>r",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace/substitude word in file" }
)
-- Common flags:

-- g – global (all matches in a line)
-- c – confirm each change
-- i – case-insensitive (override with \C)
-- I – case-sensitive (override with \c)
-- n – report matches only (don’t change)

--=[ Code actions ]=--
vim.keymap.set(
    "n",
    "<F12>d",
    [[:call setqflist([], ' ', {'title' : 'Definition: '. expand("<cword>") .'', 'lines' : systemlist('grep --exclude-dir=.svn -iHnr -E "(function<bar>event<bar>subroutine).*?\b' . expand("<cword>") . '\b.*?;"')}) <bar> copen <bar> setlocal ft=powerbuilder <bar> wincmd J <CR>]],
    { desc = "Definition of function/event" }
)

--= global usege of function
vim.keymap.set(
    "n",
    "<f12>u",
    [[:call setqflist([], ' ', {'title' : 'usage of: '. expand("<cword>") .'', 'lines' : systemlist('grep --exclude-dir=.svn -iHnr -E "\b' . expand("<cword>") . '\b"')}) <bar> copen <bar> setlocal ft=powerbuilder <bar> wincmd J <CR>
]],
    { desc = "usage of function/event" }
)

--= local usage
vim.keymap.set(
    "n",
    "<f12>l",
    [[:vimgrep/<C-r><C-w>/gj % <bar> copen <bar> setlocal ft=powerbuilder <bar> wincmd J <CR>
]],
    { desc = "Local usage of function/event" }
)

--=[ SVN commands ]=--
vim.keymap.set("n", "<f12>sl", ':!TortoiseProc.exe /command:log /path:"%"<CR>', { desc = "SVN Log" })
vim.keymap.set("n", "<f12>su", ":!svn update <CR>", { desc = "SVN Update" })

--= SVN blame
vim.cmd([[
  nnoremap <f12>sb :execute ":!TortoiseProc.exe /command:blame /path:% /line:" . line('.')<CR>
]])


vim.api.nvim_set_hl(0, "@sql.parameter", { bg = "#2E3440" })  -- deep violet
vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#ff3440" }) -- deep violet
vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = "#dd5555" }) -- deep violet
vim.api.nvim_set_hl(0, "@keyword.object.powerbuilder", { fg = "#777777" })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#777777" })
vim.api.nvim_set_hl(0, "@punctuation.delimiter.powerbuilder", { fg = "#777777" })


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
local current = vim.api.nvim_get_hl(0, { name = "@keyword" })

-- Override only italic
current.italic = false

-- Apply updated settings
vim.api.nvim_set_hl(0, "@keyword", current)

--  Highlight
vim.cmd([[
  highlight IlluminatedWordText  guibg=#005500
  highlight IlluminatedWordRead  guibg=#005500
  highlight IlluminatedWordWrite  guibg=#005500
  highlight keyword.return guibg=#ff3440
]])
