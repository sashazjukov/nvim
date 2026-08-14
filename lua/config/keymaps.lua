-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

require("config.keymaps_2")

--=[ Format injected languages (e.g., SQL inside PowerBuilder) ]=--
-- vim.keymap.set({ "n", "x" }, "<leader>cF", function()
--   require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
-- end, { desc = "Format Injected Langs" })

--=[ Format SQL with no-expand comma lists (-C flag) ]=--
vim.keymap.set({ "n", "x" }, "<leader>cC", function()
  require("conform").format({ formatters = { "sqlformat_no_expand" }, timeout_ms = 3000 })
end, { desc = "Format SQL Compact (no expand comma lists)" })

--=[ Open a markdown file in a floating window ]=--
local function open_float_file(path, title)
  local file = vim.fn.expand(path)
  local bufnr = vim.fn.bufadd(file)
  vim.fn.bufload(bufnr)

  local winid = vim.fn.bufwinid(bufnr)
  if winid ~= -1 then
    vim.api.nvim_set_current_win(winid)
    return
  end

  local width = math.floor(vim.o.columns * 0.7)
  local height = math.floor(vim.o.lines * 0.7)
  winid = vim.api.nvim_open_win(bufnr, true, {
    relative = "editor",
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    style = "minimal",
    border = "rounded",
    title = title,
    title_pos = "center",
  })

  vim.bo[bufnr].modifiable = true
  vim.bo[bufnr].readonly = false

  local function close()
    vim.api.nvim_win_close(winid, true)
  end
  vim.keymap.set("n", "q", close, { buffer = bufnr, desc = "Close floating window" })
  vim.keymap.set("n", "<Esc>", close, { buffer = bufnr, desc = "Close floating window" })
end

--=[ Run a command and show its output in a floating window ]=--
local function open_float_cmd(cmd, title, ft, width_frac)
  local wf = width_frac or 0.8
  local bufnr = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * wf)
  local height = math.floor(vim.o.lines * 0.8)
  local winid = vim.api.nvim_open_win(bufnr, true, {
    relative = "editor",
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    style = "minimal",
    border = "rounded",
    title = title,
    title_pos = "center",
  })

  local function close()
    vim.api.nvim_win_close(winid, true)
  end
  vim.keymap.set("n", "q", close, { buffer = bufnr, desc = "Close floating window" })
  vim.keymap.set("n", "<Esc>", close, { buffer = bufnr, desc = "Close floating window" })

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "Running: " .. table.concat(cmd, " ") .. " ..." })

  local function fill(lines)
    if not vim.api.nvim_buf_is_valid(bufnr) then
      return
    end
    vim.bo[bufnr].modifiable = true
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
    vim.bo[bufnr].modifiable = false
    if ft then
      vim.bo[bufnr].filetype = ft
    end
    vim.api.nvim_win_set_cursor(0, { 1, 0 })
  end

  local dir = vim.fn.expand("%:p:h")
  if dir == "" then
    dir = vim.fn.getcwd()
  end
  vim.system(cmd, { cwd = dir, text = true }, function(out)
    vim.schedule(function()
      if out.code ~= 0 and #out.stderr > 0 then
        fill(vim.split(vim.trim(out.stderr), "\n"))
        return
      end
      local lines = vim.split(vim.trim(out.stdout), "\n")
      if #lines == 1 and lines[1] == "" then
        lines = { "No changes." }
      end
      fill(lines)
    end)
  end)
end

--=[ Open personal TODO list in a floating window ]=--
vim.keymap.set("n", "<F12>t", function()
  open_float_file("~/todo_list.md", " TODO ")
end, { desc = "Open TODO list in floating window" })

--=[ Open personal quick notes in a floating window ]=--
vim.keymap.set("n", "<F12>n", function()
  open_float_file("~/quick_notes.md", " NOTES ")
end, { desc = "Open quick notes in floating window" })

--=[ Yank full path of current file ]=--
vim.keymap.set("n", "<f12>yp", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("Yanked path: " .. path)
end, { desc = "Yank full path of current file" })

--=[ Toggle invisible characters ]=--
vim.keymap.set("n", "<leader>ue", function()
  vim.opt.list = not vim.opt.list:get()
  if vim.opt.list:get() then
    vim.opt.listchars = { tab = "▸ ", trail = "·", nbsp = "·", eol = "↵", cr = "←" }
  end
end, { desc = "Toggle invisible characters" })

--=[ OSV Lua debug server ]=--
local osv_running = false
vim.keymap.set("n", "<F5>", function()
  require("osv").launch({ port = 8086 })
  osv_running = true
end, { desc = "Start OSV Lua debug server (port 8086)" })

vim.keymap.set("n", "<S-F5>", function()
  if osv_running then
    require("osv").stop()
    osv_running = false
  end
end, { desc = "Stop OSV Lua debug server" })

--=[ DAP debug controls ]=--
vim.keymap.set("n", "<F7>", function() require("dap").step_into() end, { desc = "DAP: Step Into" })
vim.keymap.set("n", "<F8>", function() require("dap").step_over() end, { desc = "DAP: Step Over" })
vim.keymap.set("n", "<S-F8>", function() require("dap").step_out() end, { desc = "DAP: Out" })
vim.keymap.set("n", "<F9>", function() require("dap").continue() end, { desc = "DAP: Continue" })
vim.keymap.set("n", "<F10>", function() require("dap").run_to_cursor()() end, { desc = "DAP: Run to cursor" })

--=[ Other usfull keymaps ]=--
vim.keymap.set({ "i" }, "jj", "<ESC>", { desc = "_ESC to Normal mode", silent = true })

vim.keymap.set("n", [[c]], [["_c]], { desc = "_Change without yanking" })
-- vim.keymap.set("n", [[""]], [["_ci"]], { desc = "_Change inside quotes" })
vim.keymap.set("n", [[vv]], [[viw]], { desc = "_Select current word" })
vim.keymap.set({ "v" }, "p", "pgvy", { desc = "_Past without yanking!" })

vim.keymap.set("n", "<A-d>", ":t.<CR>", { desc = "_duplicate line" })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "_ctrl+a and yank" })

vim.keymap.set("n", "<A-j>", "<cmd>lnext<CR>zz", { desc = "_Next quick search" })
vim.keymap.set("n", "<A-k>", "<cmd>lprev<CR>zz", { desc = "_Prev quick search" }) -- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

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
  [[:call setqflist([], ' ', {'title' : 'usage of: '. expand("<cword>") .'', 'lines' : systemlist('grep --exclude-dir=.svn -iHnr -E "\b' . expand("<cword>") . '\b"')}) <bar> copen <bar> setlocal ft=qf <bar> wincmd J <CR>
]],
  { desc = "usage of function/event" }
)

--= local usage
vim.keymap.set(
  "n",
  "<f12>l",
  [[:vimgrep/<C-r><C-w>/gj % <bar> copen <bar> setlocal ft=qf <bar> wincmd J <CR>
]],
  { desc = "Local usage of function/event" }
)

--=[ Highlight current word in buffer ]=--
vim.api.nvim_set_hl(0, "CurrentWordHighlight", { bg = "#8866aa" })
local function highlight_current_word()
  local word = vim.fn.expand("<cword>")
  vim.fn.clearmatches()
  if word ~= "" then
    vim.fn.matchadd("CurrentWordHighlight", "\\V\\<" .. vim.fn.escape(word, "\\/") .. "\\>")
  end
end
vim.keymap.set("n", "<f12>j", highlight_current_word, { desc = "Highlight current word in buffer" })
vim.keymap.set("n", "<2-LeftMouse>", highlight_current_word, { desc = "Highlight current word in buffer" })

--=[ SVN commands ]=--
vim.keymap.set("n", "<f12>sl", ':!svn log -l 3 "%"<CR>', { desc = "SVN Log" })
vim.keymap.set("n", "<f12>su", ":!svn update <CR>", { desc = "SVN Update" })
vim.keymap.set("n", "<f12>sb", ":!svn blame <CR>", { desc = "SVN Blame" })
vim.keymap.set("n", "<f12>ss", function()
  open_float_cmd({ "svn", "status" }, " SVN STATUS ")
end, { desc = "SVN Status (floating)" })
vim.keymap.set("n", "<f12>sd", function()
  -- --internal-diff overrides the external `diff-cmd` from ~/.subversion/config
  -- (which emits ANSI-colored side-by-side output). --git gives a clean
  -- unified format that `ft=diff` can highlight.
  open_float_cmd({ "svn", "diff", "--internal-diff", "--git" }, " SVN DIFF ", "diff", 0.92)
end, { desc = "SVN Diff (floating)" })
vim.keymap.set("n", "<f12>fe", ":Neotree neo-tree-filter <CR>", { desc = "NeoTree Content Filter" })
-- vim.keymap.set("n", "<f12>f", function()
--   require("neo-tree.command").execute({ source = "r_filter", toggle = true })
-- end, { desc = "neo-tree regex filter" })

----= SVN blame
--vim.cmd([[
--  nnoremap <f12>sb :execute ":!TortoiseProc.exe /command:blame /path:% /line:" . line('.')<CR>
--]])

-- vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#ff3440" }) -- deep violet
-- vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = "#dd5555" }) -- deep violet
-- vim.api.nvim_set_hl(0, "@keyword.object.powerbuilder", { fg = "#777777" })
-- vim.api.nvim_set_hl(0, "@punctuation.delimiter.sql", { fg = "#ff7777" })
-- vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#777777" })
-- vim.api.nvim_set_hl(0, "@punctuation.delimiter.powerbuilder", { fg = "#777777" })
--
-- vim.api.nvim_set_hl(0, "@sql.parameter", { bg = "#2E3440" }) -- deep violet
-- vim.api.nvim_set_hl(0, "@keyword.sql", { fg = "#6666ff" })
-- vim.api.nvim_set_hl(0, "@operator.sql", { fg = "#ff3440" })
-- -- local tmp = vim.api.nvim_get_hl(0, { name = "@type", link = nil })
-- --
-- -- vim.api.nvim_set_hl(0, "AerialClassIcon", { fg = tmp.fg })
-- -- vim.api.nvim_set_hl(0, "AerialClass", { fg = tmp.fg })
-- --
-- -- local tmp = vim.api.nvim_get_hl(0, { name = "@type", link = nil })
-- -- vim.api.nvim_set_hl(0, "AerialFile", { fg = tmp.fg })
--
-- -- vim.api.nvim_set_hl(0, "@ts.error", {
-- --     undercurl = true, -- включает волнистое подчеркивание
-- --     sp = "#ff7f7f",   -- цвет волнистой линии
-- --     -- fg = "#ff3440", -- можно добавить, если хочешь ещё и цвет текста
-- -- })
--
-- -- Get current highlight settings for @keyword
-- local current = vim.api.nvim_get_hl(0, { name = "@keyword" })
--
-- -- Override only italic
-- current.italic = false
--
-- -- Apply updated settings
-- vim.api.nvim_set_hl(0, "@keyword", current)

--  --  Highlight
--  vim.cmd([[
--    highlight IlluminatedWordText  guibg=#005500
--    highlight IlluminatedWordRead  guibg=#005500
--    highlight IlluminatedWordWrite  guibg=#005500
--    highlight keyword.return guibg=#ff3440
--  ]])
