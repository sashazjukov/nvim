-- lua/plugins/neo-tree.lua (example path)
return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- optional but recommended
        "MunifTanjim/nui.nvim",
    },
    sources = { "filesystem", "buffers", "git_status", "neo-tree-filter" },
    opts = {
        window = {
            mappings = {
                -- Expand recursively with `z`
                ["z"] = "expand_all_subnodes",
                -- (optional) Collapse everything with `Z`
                ["Z"] = "close_all_subnodes", -- if this doesn't exist in your version, try "collapse_all_nodes"
            },
        },
        -- If you only want this in the filesystem source, move the window.mappings under `filesystem = { window = { mappings = { ... }}}`
    },
}
