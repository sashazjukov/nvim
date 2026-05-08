-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("User", {
  pattern = "TSUpdate",
  callback = function()
    require("nvim-treesitter.parsers").powerbuilder = {
      install_info = {
        url = "",
        revision = "",
        path = "/home/alex/tree-sitter-powerbuilder",
        -- optional entries:
        files = { "src/parser.c" },
        --location = "src", -- only needed if the parser is in subdirectory of a "monorepo"
        generate = false, -- only needed if repo does not contain pre-generated `src/parser.c`
        generate_from_json = false, -- only needed if repo does not contain `src/grammar.json` either
        queries = "queries", -- also install queries from given directory
      },
      filetype = "powerbuilder",
      tier = 2,
    }
  end,
})

vim.treesitter.language.register("powerbuilder", { "srw", "sru", "srd", "srf", "srm", "srs" })

vim.filetype.add({
  extension = {
    srw = "powerbuilder",
    sru = "powerbuilder",
    srd = "powerbuilder",
    srf = "powerbuilder",
    srm = "powerbuilder",
    srs = "powerbuilder",
  },
})

vim.api.nvim_create_autocmd("User", {
  pattern = "TSUpdate",
  callback = function()
    require("nvim-treesitter.parsers").sql = {
      install_info = {
        -- url = "Crary-Systems/tree-sitter-sql",
        revision = "",
        path = "/home/alex/Work/nvim/ts-parsers/tree-sitter-sql",
        -- optional entries:
        -- files = { "src/parser.c" },
        --location = "src", -- only needed if the parser is in subdirectory of a "monorepo"
        generate = false, -- only needed if repo does not contain pre-generated `src/parser.c`
        generate_from_json = false, -- only needed if repo does not contain `src/grammar.json` either
        queries = "queries", -- also install queries from given directory
      },
      filetype = "sql",
      tier = 2,
    }
  end,
})

require("nvim-treesitter.parsers").sql = {
  install_info = {
    -- url = "crary-systems/tree-sitter-sql",
    revision = "",
    path = "/home/alex/work/nvim/ts-parsers/tree-sitter-sql",
    -- optional entries:
    -- files = { "src/parser.c" },
    --location = "src", -- only needed if the parser is in subdirectory of a "monorepo"
    generate = false, -- only needed if repo does not contain pre-generated `src/parser.c`
    generate_from_json = false, -- only needed if repo does not contain `src/grammar.json` either
    queries = "queries", -- also install queries from given directory
  },
  filetype = "sql",
  tier = 2,
}

vim.treesitter.language.register("sql", { "sql" })

vim.filetype.add({
  extension = {
    sql = "sql",
  },
})
---
--[[
local parser_config = require("nvim-treesitter.parsers")
parser_config.powerbuilder = {
  install_info = {
    url = "d:/SIMLINKS/tree-sitter-powerbuilder/", -- Update this path
    files = { "src/parser.c" },
    branch = "main",
    generate_requires_npm = false,
    requires_generate_from_grammar = true,
  },
  filetype = "powerbuilder",
}
]]

-- Hyprlang LSP
-- Apply hyprls when the file *path* contains "hyper" (case-insensitive).
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  -- Trigger on all files; we will filter in the callback by path.
  pattern = "*.conf",
  callback = function(event)
    -- Get the path for this buffer
    local path = event.file or vim.api.nvim_buf_get_name(event.buf)
    if not path or path == "" then
      return
    end

    -- Only proceed if the path contains "hyper" (case-insensitive)
    if not string.find(string.lower(path), "hypr", 1, true) then
      return
    end

    -- Prevent starting multiple hyprlang clients for the same buffer
    local already = vim.lsp.get_active_clients({ bufnr = event.buf, name = "hyprlang" })
    if already and #already > 0 then
      return
    end

    -- Start hyprls for this buffer
    vim.lsp.start({
      name = "hyprlang",
      cmd = { "hyprls" },
      root_dir = vim.fn.getcwd(), -- keep your original behavior
      bufnr = event.buf, -- ensure we attach to the current buffer
      settings = {
        hyprls = {
          preferIgnoreFile = true, -- set to false to prefer `hyprls.ignore`
          ignore = { "hyprlock.conf", "hypridle.conf" },
        },
      },
    })
  end,
})
