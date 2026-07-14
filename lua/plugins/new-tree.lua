-- lua/plugins/neo-tree.lua (example path)
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional but recommended
    "MunifTanjim/nui.nvim",
  },

  sources = { "filesystem", "buffers", "git_status", "neo-tree-filter" },
  require = {
    "/home/alex/Work/neo-tree-filter",
  },
  -- neo-tree-filter:{
  --
  -- }
  opts = {
    source_selector = {
      sources = {
        { source = "filesystem" },
        { source = "buffers" },
        { source = "git_status" },
        { source = "neo-tree-filter", display_name = " Content Filter " },
      },
    },
    window = {
      mappings = {
        -- Expand recursively with `z`
        ["z"] = "expand_all_subnodes",
        -- (optional) Collapse everything with `Z`
        ["Z"] = "close_all_subnodes",
      },
    },
    default_component_configs = {
      type = {
        enabled = false,
      },
      file_size = {
        enabled = false,
      },
      last_modified = {
        enabled = false,
      },
    },
    sources = { "filesystem", "buffers", "git_status", "neo-tree-filter" },
  },
}
