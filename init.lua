--     Debug init.lua and all plugins
--     nvim --cmd "lua init_debug=true"
if init_debug then
  require("osv").launch({ port = 8086, blocking = true })
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
