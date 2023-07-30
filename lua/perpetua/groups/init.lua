---@type Theme
local M = {}

function M.get(ambience)
  local theme = {}
  theme = vim.tbl_deep_extend("keep", require("perpetua.groups.editor").get(ambience), theme)
  theme = vim.tbl_deep_extend("keep", require("perpetua.groups.syntax").get(ambience), theme)

  -- TODO: load integrations based on options
  theme = vim.tbl_deep_extend("keep", require("perpetua.groups.integrations.cmp").get(ambience), theme)
  theme = vim.tbl_deep_extend("keep", require("perpetua.groups.integrations.native_lsp").get(ambience), theme)
  theme = vim.tbl_deep_extend("keep", require("perpetua.groups.integrations.treesitter").get(ambience), theme)
  return theme
end

return M
