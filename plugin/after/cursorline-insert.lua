local orig_cursorline = vim.api.nvim_get_hl(0, { name = "CursorLine" })

local function set_yellow()
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1e2e1e" })
end

local function restore()
  vim.api.nvim_set_hl(0, "CursorLine", orig_cursorline)
end

vim.api.nvim_create_autocmd("InsertEnter", { callback = set_yellow })
vim.api.nvim_create_autocmd("InsertLeave", { callback = restore })
vim.api.nvim_create_autocmd("ModeChanged", { pattern = "*:R", callback = set_yellow })
vim.api.nvim_create_autocmd("ModeChanged", { pattern = "R:*", callback = restore })
