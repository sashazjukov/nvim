local pb_extensions = {
  srw = "MiniIconsCyan",
  srd = "MiniIconsYellow",
  sru = "MiniIconsAzure",
  sra = "NeoTreeFileNamePBApp",
  srm = "MiniIconsOrange",
  srf = "MiniIconsGreen",
  srq = "MiniIconsGrey",
  srs = "MiniIconsGrey",
  srj = "MiniIconsGrey",
  pbl = "MiniIconsGrey",
  pbt = "MiniIconsGrey",
  pbw = "MiniIconsGrey",
  pbg = "MiniIconsGrey",
  sql = "MiniIconsPurple",
}

local dir_level_highlights = {}
for i = 1, 10 do
  dir_level_highlights[i] = "NeoTreeDirLevel" .. i
end

local function patch_name_component(components)
  local orig_name = components.name
  components.name = function(config, node, state)
    local result = orig_name(config, node, state)
    if node.type == "message" then
      return result
    end
    if node.type == "directory" then
      local depth = node.level + 1
      if depth <= 10 and type(result) == "table" then
        if result.text then
          result.highlight = dir_level_highlights[depth]
        elseif #result > 0 then
          result[1].highlight = dir_level_highlights[depth]
        end
      end
    else
      local ext = node.name:match("%.(%w+)$")
      if ext and pb_extensions[ext] then
        if type(result) == "table" and result.text then
          result.highlight = pb_extensions[ext]
        elseif type(result) == "table" and #result > 0 then
          result[1].highlight = pb_extensions[ext]
        end
      end
    end
    return result
  end
end

local function apply_override()
  local ok, common = pcall(require, "neo-tree.sources.common.components")
  if ok then
    patch_name_component(common)
  end

  local ok2, pb_comp = pcall(require, "neo-tree-filter.components")
  if ok2 then
    patch_name_component(pb_comp)
  end
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      once = true,
      callback = function()
        vim.defer_fn(apply_override, 100)
      end,
    })
  end,
}
