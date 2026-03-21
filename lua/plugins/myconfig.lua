local bufferline = require("bufferline")
bufferline.setup({
  options = {
    truncate_names = false, -- whether or not tab names should be truncated
  },
})

-- require("ts-comments").setup({
--   lang = {
--     powerbuilder = {
--       "// %s", -- single-line comment
--       "/* %s */", -- block comment
--     },
--   },
-- })

return {}
