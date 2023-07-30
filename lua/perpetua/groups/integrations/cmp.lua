---@type Theme
local M = {}

function M.get(_)
  return {
    CmpItemAbbrDeprecated    = { link = "DiagnosticDeprecated" },

    CmpItemAbbrMatch         = { fg = C.text0, bold = true },
    CmpItemAbbrMatchFuzzy    = { fg = C.text0, bold = true },

    CmpItemKindText          = { link = "Identifier" },

    CmpItemKindMethod        = { link = "Function" },
    CmpItemKindFunction      = { link = "Function" },
    CmpItemKindConstructor   = { link = "Function" },

    CmpItemKindField         = { link = "Identifier" },
    CmpItemKindVariable      = { link = "Identifier" },

    CmpItemKindClass         = { link = "Type" },
    CmpItemKindInterface     = { link = "Type" },

    CmpItemKindModule        = { link = "Identifier" },
    CmpItemKindProperty      = { link = "Identifier" },

    CmpItemKindUnit          = { link = "String" },

    CmpItemKindValue         = { link = "Number" },

    CmpItemKindEnum          = { link = "Type" },

    CmpItemKindKeyword       = { link = "Keyword" },

    CmpItemKindSnippet       = { link = "Identifier" },
    CmpItemKindColor         = { link = "Identifier" },
    CmpItemKindFile          = { link = "Identifier" },

    CmpItemKindReference     = { link = "Tag" },

    CmpItemKindFolder        = { link = "Directory" },

    CmpItemKindEnumMember    = { link = "Identifier" },

    CmpItemKindConstant      = { link = "Constant" },

    CmpItemKindStruct        = { link = "Type" },

    CmpItemKindEvent         = { link = "Identifier" },
    CmpItemKindOperator      = { link = "Identifier" },
    CmpItemKindTypeParameter = { link = "Identifier" },
  }
end

return M
