return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
  },
  opts = {
    -- Keep oil from becoming the default file explorer.
    -- Neo-tree/netrw stays in charge when opening directories (e.g. `vim .`).
    default_file_explorer = false,
  },
}
