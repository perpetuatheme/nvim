---@type Theme
local M = {}

function M.get(ambience)
  local highlights = {
    Comment        = { fg = C.over0 }, -- any comment

    Constant       = { fg = C.violet }, -- (*) any constant
    String         = { fg = C.pink }, -- a string constant: "this is a string"
    Character      = { link = "String" }, -- a character constant: 'c', '\n'
    Number         = { fg = C.violet }, -- a number constant: 234, 0xff
    Boolean        = { link = "Number" }, -- a boolean constant: TRUE, false
    Float          = { link = "Number" }, -- a floating point constant: 2.3e10

    Identifier     = { fg = C.text0 }, -- (*) any variable name
    Function       = { fg = C.blue }, -- function name (also: methods for classes)

    Statement      = { fg = C.red }, -- (*) any statement
    Conditional    = { link = "Statement" }, -- if, then, else, endif, switch, etc.
    Repeat         = { link = "Statement" }, -- for, do, while, etc.
    Label          = { link = "Statement" }, -- case, default, etc.
    Operator       = { fg = C.text0 }, -- "sizeof", "+", "*", etc.
    Keyword        = { link = "Statement" }, -- any other keyword
    Exception      = { link = "Statement" }, -- try, catch, throw

    PreProc        = { fg = C.turquoise }, -- (*) generic Preprocessor
    Include        = { fg = C.red }, -- preprocessor #include
    Define         = { link = "PreProc" }, -- preprocessor #define
    Macro          = { link = "Include" }, -- same as Define
    PreCondit      = { fg = C.cerulean }, -- preprocessor #if, #else, #endif, etc.

    Type           = { fg = C.yellow }, -- (*) int, long, char, etc.
    StorageClass   = { fg = C.lime }, -- static, register, volatile, etc.
    Structure      = { link = "Keyword" }, -- struct, union, enum, etc.
    Typedef        = { fg = C.orange }, -- A typedef

    Special        = { fg = C.text0 }, -- (*) any special symbol
    SpecialChar    = { fg = C.turquoise }, -- special character in a constant
    Tag            = { fg = C.lavender }, -- you can use CTRL-] on this
    Delimiter      = { link = "Special" }, -- character that needs attention
    SpecialComment = { link = "Comment" }, -- special things inside a comment
    Debug          = { link = "Special" }, -- debugging statements

    Underlined     = { underline = true }, -- text that stands out, HTML links
    Ignore         = { fg = C.text0 }, -- left blank, hidden  |hl-Ignore|
    Error          = { fg = C.red, bg = C.red_back }, -- any erroneous construct
    Todo           = { fg = C.text0, bg = C.yellow_back }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
  }

  if ambience == "dark" then
    highlights.Constant     = { fg = C.red } -- (*) any constant
    highlights.String       = { fg = C.yellow } -- a string constant: "this is a string"
    highlights.Number       = { fg = C.red } -- a number constant: 234, 0xff

    highlights.Function     = { fg = C.violet } -- function name (also: methods for classes)

    highlights.Statement    = { fg = C.pink } -- (*) any statement

    highlights.PreProc      = { fg = C.cerulean } -- (*) generic Preprocessor
    highlights.Include      = { fg = C.pink } -- preprocessor #include
    highlights.PreCondit    = { fg = C.blue } -- preprocessor #if, #else, #endif, etc.

    highlights.Type         = { fg = C.orange } -- (*) int, long, char, etc.
    highlights.StorageClass = { fg = C.yellow } -- static, register, volatile, etc.
    highlights.Typedef      = { fg = C.red } -- A typedef

    highlights.SpecialChar  = { fg = C.cerulean } -- special character in a constant
  end

  return highlights
end

return M
