-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false

--=[ Syntax from sytax folder ]=--
vim.filetype.add({
  extension = {
    dbout = "dbout",
    log = "log",
  },
})

function CopyFilePathToClipboard()
  local filePath = vim.fn.expand("%")
  vim.fn.setreg("+", filePath)
end

vim.opt.expandtab = true -- Use tabs instead of spaces
vim.opt.tabstop = 4      -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4   -- Number of spaces for each indent level

-- vim.opt.scrolloff = 0
vim.opt.mouse = "n"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "powerbuilder",
  callback = function()
    vim.opt.expandtab = true -- Use tabs instead of spaces
    vim.opt.tabstop = 2      -- Number of spaces a <Tab> counts for
    vim.opt.shiftwidth = 2   -- Number of spaces for each indent level
  end,
})

-- Map the function to <leader>cp
--vim.keymap.set("n", "<leader>yp", CopyFilePathToClipboard, { desc = "Copy File Path to Clipboard" })

-- Example: Override Tree-sitter colors in LazyVim
-- vim.api.nvim_set_hl(0, "@function", { fg = "#9b59b6" }) -- violet for functions
-- vim.api.nvim_set_hl(0, "@variable", { fg = "#8e44ad" }) -- darker violet for variables
-- vim.api.nvim_set_hl(0, "@string",   { fg = "#bb8fce" }) -- lighter violet for strings

vim.opt_local.list = false -- Enable list only for sensitive filetypes
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "python", "yaml", "make" }, -- add more if needed
--   callback = function()
--     vim.opt_local.list = true
--     vim.opt_local.listchars = {
--       tab = ">-", -- Tabs
--       trail = "~", -- Trailing spaces
--       space = "·", -- Spaces
--     }
--   end,
-- })
--
-- Disable list for all other filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- if not vim.tbl_contains({ "python", "yaml", "make" }, vim.bo.filetype) then
    vim.opt_local.list = false
    -- end
  end,
})
