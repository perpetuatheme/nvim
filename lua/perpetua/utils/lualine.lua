local M = {}

function M.get(ambience)
  if not ambience then ambience = M.options.ambience end

  local ok, palette = pcall(require, "perpetua.palettes." .. ambience)
  if not ok then
    Errorf("Could not load palette '%s'", ambience)
    return
  end
  ---@type PerpetuaPalette
  C = palette

  local perpetua = {}

  perpetua.normal = {
    a = { fg = C.base0, bg = C.blue, gui = "bold" },
    b = { fg = C.blue, bg = C.base3 },
    c = { fg = C.text0, bg = C.base1 },
  }

  perpetua.insert = {
    a = { fg = C.base0, bg = C.green, gui = "bold" },
    b = { fg = C.green, bg = C.base3 },
  }

  perpetua.visual = {
    a = { fg = C.base0, bg = C.violet, gui = "bold" },
    b = { fg = C.violet, bg = C.base3 },
  }

  perpetua.replace = {
    a = { fg = C.base0, bg = C.red, gui = "bold" },
    b = { fg = C.red, bg = C.base3 },
  }

  perpetua.command = {
    a = { fg = C.base0, bg = C.yellow, gui = "bold" },
    b = { fg = C.yellow, bg = C.base3 },
  }

  perpetua.terminal = {
    a = { fg = C.base0, bg = C.green, gui = "bold" },
    b = { fg = C.green, bg = C.base3 },
  }

  perpetua.inactive = {
    a = { fg = C.blue, bg = C.base1 },
    b = { fg = C.base5, bg = C.base1, gui = "bold" },
    c = { fg = C.over1, bg = C.base1 },
  }

  return perpetua
end

return M
