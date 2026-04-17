local lspconfig = require("lspconfig")

lspconfig.omnisharp.setup({
    cmd = {
        "dotnet",
        vim.fn.stdpath("data")
        .. "/mason/packages/omnisharp/libexec/OmniSharp.dll",
    },

    enable_import_completion = true,
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
})



require("nvim-web-devicons").set_icon({ srw = { icon = "", color = "#89E051", cterm_color = "113", name = "Srw" }, })
require("nvim-web-devicons").set_icon_by_filetype({ srw = "srw" })
