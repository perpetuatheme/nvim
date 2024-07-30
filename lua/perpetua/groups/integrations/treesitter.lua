---@type Theme
local M = {}

function M.get(ambience)
  local highlights = {
    -- Reference: https://github.com/nvim-treesitter/nvim-treesitter/blob/1c79da3300951e934f635eaf8703480b57644e7e/CONTRIBUTING.md

    ["@comment"]               = { link = "Comment" }, -- line and block comments
    ["@comment.documentation"] = { link = "Comment" }, -- comments documenting code
    ["@error"]                 = { link = "Error" }, -- syntax/parser errors
    ["@none"]                  = { link = "Normal" }, -- completely disable the highlight
    ["@preproc"]               = { link = "PreProc" }, -- various preprocessor directives & shebangs
    ["@define"]                = { link = "Define" }, -- preprocessor definition directives
    ["@operator"]              = { link = "Operator" }, -- symbolic operators (e.g. `+` / `*`)

    -- Punctuation
    ["@punctuation.delimiter"] = { link = "Delimiter" }, -- delimiters (e.g. `;` / `.` / `,`)
    ["@punctuation.bracket"]   = { link = "Delimiter" }, -- brackets (e.g. `()` / `{}` / `[]`)
    ["@punctuation.special"]   = { link = "SpecialChar" }, -- special symbols (e.g. `{}` in string interpolation)

    -- Literals
    ["@string"]                = { link = "String" }, -- string literals
    ["@string.documentation"]  = { link = "Comment" }, -- string documenting code (e.g. Python docstrings)
    ["@string.regex"]          = { link = "String" }, -- regular expressions
    ["@string.escape"]         = { link = "SpecialChar" }, -- escape sequences
    ["@string.special"]        = { link = "SpecialChar" }, -- other special strings (e.g. dates)

    ["@character"]             = { link = "Character" }, -- character literals
    ["@character.special"]     = { link = "SpecialChar" }, -- special characters (e.g. wildcards)

    ["@boolean"]               = { link = "Boolean" }, -- boolean literals
    ["@number"]                = { link = "Number" }, -- numeric literals
    ["@float"]                 = { link = "Float" }, -- floating-point number literals

    -- Functions
    ["@function"]              = { link = "Function" }, -- function definitions
    ["@function.builtin"]      = { fg = C.violet }, -- built-in functions
    ["@function.call"]         = { link = "Function" }, -- function calls
    ["@function.macro"]        = { fg = C.lime }, -- preprocessor macros

    ["@method"]                = { link = "Function" }, -- method definitions
    ["@method.call"]           = { link = "Function" }, -- method calls

    ["@constructor"]           = { link = "Function" }, -- constructor calls and definitions
    ["@parameter"]             = { fg = C.green }, -- parameters of a function

    -- Keywords
    ["@keyword"]               = { link = "Keyword" }, -- various keywords
    ["@keyword.coroutine"]     = { link = "Keyword" }, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    ["@keyword.function"]      = { link = "Keyword" }, -- keywords that define a function (e.g. `func` in Go, `def` in Python)
    ["@keyword.operator"]      = { link = "Keyword" }, -- operators that are English words (e.g. `and` / `or`)
    ["@keyword.return"]        = { link = "Keyword" }, -- keywords like `return` and `yield`

    ["@conditional"]           = { link = "Conditional" }, -- keywords related to conditionals (e.g. `if` / `else`)
    ["@conditional.ternary"]   = { link = "Conditional" }, -- ternary operator (e.g. `?` / `:`)

    ["@repeat"]                = { link = "Repeat" }, -- keywords related to loops (e.g. `for` / `while`)
    ["@debug"]                 = { link = "Debug" }, -- keywords related to debugging
    ["@label"]                 = { link = "Label" }, -- GOTO and other labels (e.g. `label:` in C)
    ["@include"]               = { link = "Include" }, -- keywords for including modules (e.g. `import` / `from` in Python)
    ["@exception"]             = { link = "Exception" }, -- keywords related to exceptions (e.g. `throw` / `catch`)

    -- Type
    ["@type"]                  = { link = "Type" }, -- type or class definitions and annotations
    ["@type.builtin"]          = { link = "Type" }, -- built-in types
    ["@type.definition"]       = { link = "Typedef" }, -- type definitions (e.g. `typedef` in C)
    ["@type.qualifier"]        = { link = "Type" }, -- type qualifiers (e.g. `const`)

    ["@storageclass"]          = { link = "StorageClass" }, -- modifiers that affect storage in memory or life-time
    ["@attribute"]             = { fg = C.text0, bg = C.blue_back }, -- attribute annotations (e.g. Python decorators)
    ["@field"]                 = { link = "Identifier" }, -- object and struct fields
    ["@property"]              = { link = "Identifier" }, -- similar to `@field`

    -- Identifiers
    ["@variable"]              = { link = "Identifier" }, -- various variable names
    ["@variable.builtin"]      = { fg = C.green }, -- built-in variable names (e.g. `this`)

    ["@constant"]              = { link = "Constant" }, -- constant identifiers
    ["@constant.builtin"]      = { link = "Constant" }, -- built-in constant values
    ["@constant.macro"]        = { link = "Macro" }, -- constants defined by the preprocessor

    ["@namespace"]             = { link = "Identifier" }, -- modules or namespaces
    ["@symbol"]                = { link = "Typedef" }, -- symbols or atoms

    -- Text
    ["@text"]                  = { fg = C.text0 }, -- non-structured text
    ["@text.strong"]           = { bold = true }, -- bold text
    ["@text.emphasis"]         = { italic = true }, -- text with emphasis
    ["@text.underline"]        = { link = "Underlined" }, -- underlined text
    ["@text.strike"]           = { strikethrough = true }, -- strikethrough text
    ["@text.title"]            = { link = "Title" }, -- text that is part of a title
    ["@text.quote"]            = { fg = C.text0 }, -- text quotations
    ["@text.uri"]              = { fg = C.blue, underline = true }, -- URIs (e.g. hyperlinks)
    ["@text.math"]             = { fg = C.cyan }, -- math environments (e.g. `$ ... $` in LaTeX)
    ["@text.environment"]      = { fg = C.lime }, -- text environments of markup languages
    ["@text.environment.name"] = { fg = C.cyan }, -- text indicating the type of an environment
    ["@text.reference"]        = { link = "Tag" }, -- text references, footnotes, citations, etc.

    ["@text.literal"]          = { fg = C.turquoise }, -- literal or verbatim text (e.g., inline code)
    ["@text.literal.block"]    = { fg = C.turquoise }, -- literal or verbatim text as a stand-alone block (use priority 90 for blocks with injections)

    ["@text.todo"]             = { link = "Todo" }, -- todo notes
    ["@text.note"]             = { fg = C.text1, bg = C.blue_back }, -- info notes
    ["@text.warning"]          = { link = "Todo" }, -- warning notes
    ["@text.danger"]           = { fg = C.text1, bg = C.red_back }, -- danger/error notes

    ["@text.diff.add"]         = { link = "DiffAdd" }, -- added text (for diff files)
    ["@text.diff.delete"]      = { link = "DiffDelete" }, -- deleted text (for diff files)

    -- Tags
    ["@tag"]                   = { link = "Constant" }, -- XML tag names
    ["@tag.attribute"]         = { fg = C.green }, -- XML tag attributes
    ["@tag.delimiter"]         = { link = "Delimiter" }, -- XML tag delimiters
  }

  if ambience == "dark" then
    highlights["@function.builtin"]      = { fg = C.red } -- built-in functions
    highlights["@function.call"]         = { fg = C.turquoise } -- function calls
    highlights["@function.macro"]        = { fg = C.yellow } -- preprocessor macros

    highlights["@method.call"]           = { fg = C.turquoise } -- method calls

    highlights["@constructor"]           = { fg = C.green } -- constructor calls and definitions
    highlights["@parameter"]             = { fg = C.blue } -- parameters of a function

    highlights["@attribute"]             = { fg = C.lime } -- attribute annotations (e.g. Python decorators)

    highlights["@variable.builtin"]      = { fg = C.blue } -- built-in variable names (e.g. `this`)

    highlights["@text.uri"]              = { fg = C.violet, underline = true } -- URIs (e.g. hyperlinks)
    highlights["@text.math"]             = { fg = C.cerulean } -- math environments (e.g. `$ ... $` in LaTeX)
    highlights["@text.environment"]      = { fg = C.green } -- text environments of markup languages
    highlights["@text.environment.name"] = { fg = C.cerulean } -- text indicating the type of an environment

    highlights["@text.literal"]          = { fg = C.cyan } -- literal or verbatim text (e.g., inline code)
    highlights["@text.literal.block"]    = { fg = C.cyan } -- literal or verbatim text as a stand-alone block (use priority 90 for blocks with injections)

    highlights["@tag.attribute"]         = { fg = C.blue } -- XML tag attributes
  end

  return highlights
end

return M
