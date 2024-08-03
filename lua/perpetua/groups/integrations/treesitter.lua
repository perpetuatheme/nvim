---@type Theme
local M = {}

function M.get(ambience)
  local highlights = {
    -- Reference: https://github.com/nvim-treesitter/nvim-treesitter/blob/51bba660a89e0027929206b622c9c1cbdd995cfb/CONTRIBUTING.md

    -- Identifiers
    ["@variable"]                   = { link = "Identifier" }, -- various variable names
    ["@variable.builtin"]           = { fg = C.green }, -- built-in variable names (e.g. `this`)
    ["@variable.parameter"]         = { fg = C.green }, -- parameters of a function
    ["@variable.parameter.builtin"] = { fg = C.green }, -- special parameters (e.g. `_`, `it`)
    ["@variable.member"]            = { link = "Identifier" }, -- object and struct fields

    ["@constant"]                   = { link = "Constant" }, -- constant identifiers
    ["@constant.builtin"]           = { link = "Constant" }, -- built-in constant values
    ["@constant.macro"]             = { link = "Macro" }, -- constants defined by the preprocessor

    ["@module"]                     = { link = "Identifier" }, -- modules or namespaces
    ["@module.builtin"]             = { link = "Identifier" }, -- built-in modules or namespaces
    ["@label"]                      = { link = "Label" }, -- GOTO and other labels (e.g. `label:` in C), including heredoc labels

    -- Literals
    ["@string"]                = { link = "String" }, -- string literals
    ["@string.documentation"]  = { link = "Comment" }, -- string documenting code (e.g. Python docstrings)
    ["@string.regexp"]         = { link = "String" }, -- regular expressions
    ["@string.escape"]         = { link = "SpecialChar" }, -- escape sequences
    ["@string.special"]        = { link = "SpecialChar" }, -- other special strings (e.g. dates)
    ["@string.special.symbol"] = { link = "Typedef" }, -- symbols or atoms
    ["@string.special.url"]    = { fg = C.blue, underline = true }, -- URIs (e.g. hyperlinks)
    ["@string.special.path"]   = { fg = C.blue, underline = true }, -- filenames

    ["@character"]             = { link = "Character" }, -- character literals
    ["@character.special"]     = { link = "SpecialChar" }, -- special characters (e.g. wildcards)

    ["@boolean"]               = { link = "Boolean" }, -- boolean literals
    ["@number"]                = { link = "Number" }, -- numeric literals
    ["@number.float"]          = { link = "Float" }, -- floating-point number literals

    -- Types
    ["@type"]              = { link = "Type" }, -- type or class definitions and annotations
    ["@type.builtin"]      = { link = "Type" }, -- built-in types
    ["@type.definition"]   = { link = "Typedef" }, -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)

    ["@attribute"]         = { fg = C.text0, bg = C.blue_back }, -- attribute annotations (e.g. Python decorators, Rust lifetimes)
    ["@attribute.builtin"] = { fg = C.text0, bg = C.blue_back }, -- builtin annotations (e.g. `@property` in Python)
    ["@property"]          = { link = "Identifier" }, -- the key in key/value pairs

    -- Functions
    ["@function"]             = { link = "Function" }, -- function definitions
    ["@function.builtin"]     = { fg = C.violet }, -- built-in functions
    ["@function.call"]        = { link = "Function" }, -- function calls
    ["@function.macro"]       = { fg = C.lime }, -- preprocessor macros

    ["@function.method"]      = { link = "Function" }, -- method definitions
    ["@function.method.call"] = { link = "Function" }, -- method calls

    ["@constructor"]          = { link = "Function" }, -- constructor calls and definitions
    ["@operator"]             = { link = "Operator" }, -- symbolic operators (e.g. `+` / `*`)

    -- Keywords
    ["@keyword"]                     = { link = "Keyword" }, -- keywords not fitting into specific categories
    ["@keyword.coroutine"]           = { link = "Keyword" }, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    ["@keyword.function"]            = { link = "Keyword" }, -- keywords that define a function (e.g. `func` in Go, `def` in Python)
    ["@keyword.operator"]            = { link = "Keyword" }, -- operators that are English words (e.g. `and` / `or`)
    ["@keyword.import"]              = { link = "Include" }, -- keywords for including or exporting modules (e.g. `import` / `from` in Python)
    ["@keyword.type"]                = { link = "Keyword" }, -- keywords describing namespaces and composite types (e.g. `struct`, `enum`)
    ["@keyword.modifier"]            = { link = "Type" }, -- keywords modifying other constructs (e.g. `const`, `static`, `public`)
    ["@keyword.repeat"]              = { link = "Repeat" }, -- keywords related to loops (e.g. `for` / `while`)
    ["@keyword.return"]              = { link = "Keyword" }, -- keywords like `return` and `yield`
    ["@keyword.debug"]               = { link = "Debug" }, -- keywords related to debugging
    ["@keyword.exception"]           = { link = "Exception" }, -- keywords related to exceptions (e.g. `throw` / `catch`)

    ["@keyword.conditional"]         = { link = "Conditional" }, -- keywords related to conditionals (e.g. `if` / `else`)
    ["@keyword.conditional.ternary"] = { link = "Conditional" }, -- ternary operator (e.g. `?` / `:`)

    ["@keyword.directive"]           = { link = "PreProc" }, -- various preprocessor directives & shebangs
    ["@keyword.directive.define"]    = { link = "Define" }, -- preprocessor definition directives

    -- Punctuation
    ["@punctuation.delimiter"] = { link = "Delimiter" }, -- delimiters (e.g. `;` / `.` / `,`)
    ["@punctuation.bracket"]   = { link = "Delimiter" }, -- brackets (e.g. `()` / `{}` / `[]`)
    ["@punctuation.special"]   = { link = "SpecialChar" }, -- special symbols (e.g. `{}` in string interpolation)

    -- Comments
    ["@comment"]               = { link = "Comment" }, -- line and block comments
    ["@comment.documentation"] = { link = "Comment" }, -- comments documenting code

    ["@comment.error"]         = { fg = C.text1, bg = C.red_back }, -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
    ["@comment.warning"]       = { link = "Todo" }, -- warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
    ["@comment.todo"]          = { link = "Todo" }, -- todo-type comments (e.g. `TODO`, `WIP`)
    ["@comment.note"]          = { fg = C.text1, bg = C.blue_back }, -- note-type comments (e.g. `NOTE`, `INFO`, `XXX`)

    -- Markup
    ["@markup.strong"]         = { bold = true }, -- bold text
    ["@markup.italic"]         = { italic = true }, -- italic text
    ["@markup.strikethrough"]  = { strikethrough = true }, -- struck-through text
    ["@markup.underline"]      = { link = "Underlined" }, -- underlined text (only for literal underline markup!)

    ["@markup.heading"]        = { link = "Title" }, -- headings, titles (including markers)
    ["@markup.heading.1"]      = { link = "Title" }, -- top-level heading
    ["@markup.heading.2"]      = { link = "Title" }, -- section heading
    ["@markup.heading.3"]      = { link = "Title" }, -- subsection heading
    ["@markup.heading.4"]      = { link = "Title" }, -- and so on
    ["@markup.heading.5"]      = { link = "Title" }, -- and so forth
    ["@markup.heading.6"]      = { link = "Title" }, -- six levels ought to be enough for anybody

    ["@markup.quote"]          = { fg = C.text0 }, -- block quotes
    ["@markup.math"]           = { fg = C.cyan }, -- math environments (e.g. `$ ... $` in LaTeX)

    ["@markup.link"]           = { link = "Tag" }, -- text references, footnotes, citations, etc.
    ["@markup.link.label"]     = { link = "SpecialChar" }, -- link, reference descriptions
    ["@markup.link.url"]       = { fg = C.blue, underline = true }, -- URL-style links

    ["@markup.raw"]            = { fg = C.turquoise }, -- literal or verbatim text (e.g. inline code)
    ["@markup.raw.block"]      = { fg = C.turquoise }, -- literal or verbatim text as a stand-alone block (use priority 90 for blocks with injections)

    ["@markup.list"]           = { link = "SpecialChar" }, -- list markers
    ["@markup.list.checked"]   = { fg = C.green }, -- checked todo-style list markers
    ["@markup.list.unchecked"] = { fg = C.text2 }, -- unchecked todo-style list markers

    ["@diff.plus"]             = { link = "DiffAdd" }, -- added text (for diff files)
    ["@diff.minus"]            = { link = "DiffDelete" }, -- deleted text (for diff files)
    ["@diff.delta"]            = { link = "DiffChange" }, -- changed text (for diff files)

    ["@tag"]                   = { link = "Constant" }, -- XML-style tag names (and similar)
    ["@tag.builtin"]           = { link = "Constant" }, -- builtin tag names (e.g. HTML5 tags)
    ["@tag.attribute"]         = { fg = C.green }, -- XML-style tag attributes
    ["@tag.delimiter"]         = { link = "Delimiter" }, -- XML-style tag delimiters
  }

  if ambience == "dark" then
    -- Identifiers
    highlights["@variable.builtin"]           = { fg = C.blue } -- built-in variable names (e.g. `this`)
    highlights["@variable.parameter"]         = { fg = C.blue } -- parameters of a function
    highlights["@variable.parameter.builtin"] = { fg = C.blue } -- special parameters (e.g. `_`, `it`)

    -- Literals
    highlights["@string.special.url"]  = { fg = C.violet, underline = true } -- URIs (e.g. hyperlinks)
    highlights["@string.special.path"] = { fg = C.violet, underline = true } -- filenames

    -- Types
    highlights["@attribute"]         = { fg = C.lime } -- attribute annotations (e.g. Python decorators, Rust lifetimes)
    highlights["@attribute.builtin"] = { fg = C.lime } -- builtin annotations (e.g. `@property` in Python)

    -- Functions
    highlights["@function.builtin"]     = { fg = C.red } -- built-in functions
    highlights["@function.call"]        = { fg = C.turquoise } -- function calls
    highlights["@function.macro"]       = { fg = C.yellow } -- preprocessor macros

    highlights["@function.method.call"] = { fg = C.turquoise } -- method calls

    highlights["@constructor"]          = { fg = C.green } -- constructor calls and definitions

    -- Markup
    highlights["@markup.math"]      = { fg = C.cerulean } -- math environments (e.g. `$ ... $` in LaTeX)

    highlights["@markup.link.url"]  = { fg = C.violet, underline = true } -- URL-style links

    highlights["@markup.raw"]       = { fg = C.cyan } -- literal or verbatim text (e.g. inline code)
    highlights["@markup.raw.block"] = { fg = C.cyan } -- literal or verbatim text as a stand-alone block (use priority 90 for blocks with injections)

    highlights["@tag.attribute"]    = { fg = C.blue } -- XML-style tag attributes
  end

  return highlights
end

return M
