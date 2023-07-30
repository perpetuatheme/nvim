---@type Perpetua
local M = {
  default_options = {
    ambience = "dark",
  },
}

M.options = M.default_options

local did_setup = false

function M.load(ambience)
  if vim.version().minor < 8 then
    vim.notify_once("Perpetua (info): Neovim 0.8 or higher is required", vim.log.levels.INFO)
    return
  end

  if not did_setup then M.setup() end
  if not ambience then ambience = M.options.ambience end

  vim.o.termguicolors = true
  if vim.g.colors_name then vim.cmd("hi clear") end
  vim.g.colors_name = "perpetua-" .. ambience
  vim.o.background = ambience

  local ok, palette = pcall(require, "perpetua.palettes." .. ambience)
  if not ok then
    Errorf("Could not load palette '%s'", ambience)
    return
  end
  ---@type PerpetuaPalette
  C = palette

  local terminal = require("perpetua.groups.terminal").get()
  for terminal_color, color in pairs(terminal) do
    vim.g[terminal_color] = color
  end

  local theme = require("perpetua.groups").get(ambience)
  for group, colors in pairs(theme) do
    vim.api.nvim_set_hl(0, group, colors)
  end
end

---@type fun(user_opts: PerpetuaOptions|nil)
function M.setup(user_opts)
  did_setup = true

  user_opts = user_opts or {}
  M.options = vim.tbl_deep_extend("keep", user_opts, M.default_options)
end

---@param format string
---@param ... any
function Errorf(format, ...)
  vim.notify_once(
    string.format("Perpetua (error): " .. format, ...),
    vim.log.levels.ERROR
  )
end

return M
