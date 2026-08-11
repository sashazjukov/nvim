---@meta {}
vim = vim or {}

vim.api.nvim_set_hl(0, "@lualine_filename", { fg = "#aaffaa", bold = true }) -- deep violet

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    local icons = LazyVim.config.icons

    txt = function()
      return LazyVim.root.cwd()
    end

    color = function()
      return { fg = Snacks.util.color("Special") }
    end
    opts.sections.lualine_c = {

      { txt, color = color() },

      {
        LazyVim.lualine.pretty_path({
          modified_sign = " [+]",
          relative = "cwd",
          filename_hl = "@lualine_filename",
          length = 20,
        }),
        color = color(),
      },
      -- {
      --     'filename',
      --     file_status = true,    -- Displays file status (readonly status, modified status)
      --     newfile_status = true, -- Display new file status (new file means no write after created)
      --     path = 1,              -- 0: Just the filename
      --     -- 1: Relative path
      --     -- 2: Absolute path
      --     -- 3: Absolute path, with tilde as the home directory
      --     -- 4: Filename and parent dir, with tilde as the home directory
      --
      --     shorting_target = 40, -- Shortens path to leave 40 spaces in the window
      --     -- for other components. (terrible name, any suggestions?)
      --     -- It can also be a function that returns
      --     -- the value of `shorting_target` dynamically.
      --     symbols = {
      --         modified = '[+]',      -- Text to show when the file is modified.
      --         readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
      --         unnamed = '[No Name]', -- Text to show for unnamed buffers.
      --         newfile = '[New]',     -- Text to show for newly created file before first write
      --     }
      -- },

      {
        "aerial",
        -- The separator to be used to separate symbols in status line.
        sep = ".",

        -- The number of symbols to render top-down. In order to render only 'N' last
        -- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
        -- be used in order to render only current symbol.
        depth = nil,

        -- When 'dense' mode is on, icons are not rendered near their symbols. Only
        -- a single icon that represents the kind of current symbol is rendered at
        -- the beginning of status line.
        dense = false,

        -- The separator to be used to separate symbols in dense mode.
        dense_sep = ".",

        -- Color the symbol icons.
        colored = true,
      },
      {
        "diagnostics",
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warn,
          info = icons.diagnostics.Info,
          hint = icons.diagnostics.Hint,
        },
      },
    }
    --  
    table.insert(opts.sections.lualine_y, {
      function()
        return require("opencode").statusline()
      end,
    })
    table.insert(
      opts.sections.lualine_y,
      { "filetype", icon_only = false, separator = " |", padding = { left = 1, right = 0 } }
    )
  end,
}
