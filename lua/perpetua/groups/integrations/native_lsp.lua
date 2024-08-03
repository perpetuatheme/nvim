---@type Theme
local M = {}

function M.get(_)
  return {
    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    LspReferenceText            = { fg = C.blue, bg = C.base3 }, -- used for highlighting "text" references
    LspReferenceRead            = { link = "LspReferenceText" }, -- used for highlighting "read" references
    LspReferenceWrite           = { link = "LspReferenceText" }, -- used for highlighting "write" references
    LspInlayHint                = { link = "NonText" }, -- used for highlighting inlay hints
    LspCodeLens                 = { link = "Comment" }, -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    LspCodeLensSeparator        = { fg = C.blue }, -- Used to color the separator between two or more code lenses.
    LspSignatureActiveParameter = { fg = C.violet }, -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    DiagnosticError             = { fg = C.red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn              = { fg = C.orange }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo              = { fg = C.cerulean }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint              = { fg = C.over0 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk                = { fg = C.green }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)

    DiagnosticVirtualTextError  = { fg = C.red, bg = C.red_back }, -- Used for "Error" diagnostic virtual text.
    DiagnosticVirtualTextWarn   = { fg = C.orange, bg = C.orange_back }, -- Used for "Warn" diagnostic virtual text.
    DiagnosticVirtualTextInfo   = { fg = C.cerulean, bg = C.cerulean_back }, -- Used for "Info" diagnostic virtual text.
    DiagnosticVirtualTextHint   = { fg = C.over0, bg = C.base1 }, -- Used for "Hint" diagnostic virtual text.
    DiagnosticVirtualTextOk     = { fg = C.green, bg = C.green_back }, -- Used for "Ok" diagnostic virtual text.

    DiagnosticUnderlineError    = { sp = C.red, underline = true }, -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn     = { sp = C.orange, underline = true }, -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo     = { sp = C.cerulean, underline = true }, -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint     = { sp = C.over0, underline = true }, -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk       = { sp = C.green, underline = true }, -- Used to underline "Ok" diagnostics.

    DiagnosticFloatingError     = { fg = C.red }, -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    DiagnosticFloatingWarn      = { fg = C.orange }, -- Used to color "Warn" diagnostic messages in diagnostics float.
    DiagnosticFloatingInfo      = { fg = C.cerulean }, -- Used to color "Info" diagnostic messages in diagnostics float.
    DiagnosticFloatingHint      = { fg = C.over0 }, -- Used to color "Hint" diagnostic messages in diagnostics float.
    DiagnosticFloatingOk        = { fg = C.green }, -- Used to color "Ok" diagnostic messages in diagnostics float.

    DiagnosticSignError         = { fg = C.red }, -- Used for "Error" signs in sign column.
    DiagnosticSignWarn          = { fg = C.orange }, -- Used for "Warn" signs in sign column.
    DiagnosticSignInfo          = { fg = C.cerulean }, -- Used for "Info" signs in sign column.
    DiagnosticSignHint          = { fg = C.over0 }, -- -- Used for "Hint" signs in sign column.
    DiagnosticSignOk            = { fg = C.green }, --- Used for "Ok" signs in sign column.

    DiagnosticDeprecated        = { fg = C.over0, strikethrough = true }, -- Used for deprecated or obsolete code.
    DiagnosticUnnecessary       = { link = "Comment" }, -- Used for unnecessary or unused code.
  }
end

return M
