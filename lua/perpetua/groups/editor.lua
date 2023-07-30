---@type Theme
local M = {}

function M.get(_)
  return {
    Normal         = { fg = C.text0, bg = C.base0 }, -- Normal text.
    NormalNC       = { link = "Normal" }, -- Normal text in non-current windows.
    NormalFloat    = { fg = C.text0, bg = C.base1 }, -- Normal text in floating windows.
    ColorColumn    = { bg = C.base2 }, -- Used for the columns set with 'colorcolumn'.
    Conceal        = { fg = C.over1 }, -- Placeholder characters substituted for concealed text (see 'conceallevel').
    CurSearch      = { fg = C.text0, bg = C.turquoise_back }, -- Used for highlighting a search pattern under the cursor (see 'hlsearch').
    Cursor         = { fg = C.base0, bg = C.text0 }, -- Character under the cursor.
    lCursor        = { link = "Cursor" }, -- Character under the cursor when |language-mapping| is used (see 'guicursor').
    CursorIM       = { link = "Cursor" }, -- Like Cursor, but used when in IME mode.
    CursorColumn   = { link = "ColorColumn" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine     = { link = "ColorColumn" }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory      = { fg = C.blue }, -- Directory names (and other special names in listings).
    DiffAdd        = { fg = C.green, bg = C.green_back }, -- Diff mode: Added line. |diff.txt|
    DiffChange     = { fg = C.yellow, bg = C.yellow_back }, -- Diff mode: Changed line. |diff.txt|
    DiffDelete     = { fg = C.red, bg = C.red_back }, -- Diff mode: Deleted line. |diff.txt|
    DiffText       = { fg = C.blue, bg = C.blue_back }, -- Diff mode: Changed text within a changed line. |diff.txt|
    EndOfBuffer    = { fg = C.base2 }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor     = { fg = C.base0, bg = C.base5 }, -- Cursor in a focused terminal.
    TermCursorNC   = { fg = C.over0 }, -- Cursor in an unfocused terminal.
    ErrorMsg       = { fg = C.red, bold = true }, -- Error messages on the command line.
    VertSplit      = { fg = C.base2 }, -- Column separating vertically split windows
    FloatBorder    = { link = "VertSplit" }, -- Border of floating windows.
    Winseparator   = { link = "VertSplit" }, -- Separators between window splits.
    Folded         = { fg = C.text2, bg = C.base3 }, -- Line used for closed folds.
    FoldColumn     = { fg = C.over0 }, -- 'foldcolumn'
    SignColumn     = { fg = C.base5 }, -- Column where |signs| are displayed.
    IncSearch      = { fg = C.text1, bg = C.green_back }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c".
    Substitute     = { fg = C.text0, bg = C.lime_back }, -- |:substitute| replacement text highlighting.
    LineNr         = { fg = C.base5 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove    = { link = "LineNr" }, -- Line number for when the 'relativenumber' option is set, above the cursor line.
    LineNrBelow    = { link = "LineNr" }, -- Line number for when the 'relativenumber' option is set, below the cursor line.
    CursorLineNr   = { fg = C.text2, bg = C.base2 }, -- Like LineNr when 'cursorline' is set and 'cursorlineopt' contains "number" or is "both", for the cursor line.
    -- CursorLineFold = { }, -- Like FoldColumn when 'cursorline' is set for the cursor line.
    -- CursorLineSign = { }, -- Like SignColumn when 'cursorline' is set for the cursor line.
    MatchParen     = { fg = C.red, bg = C.red_back }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg        = { fg = C.text1, bold = true }, -- 'showmode' message (e.g., "-- INSERT --").
    MsgArea        = { fg = C.text0 }, -- Area for messages and cmdline.
    MoreMsg        = { fg = C.turquoise }, -- |more-prompt|
    NonText        = { fg = C.base5 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Pmenu          = { fg = C.over2, bg = C.base1 }, -- Popup menu: Normal item.
    PmenuSel       = { fg = C.text1, bg = C.base3, bold = true }, -- Popup menu: Selected item.
    PmenuKind      = { link = "Pmenu" }, -- Popup menu: Normal item "kind".
    PmenuKindSel   = { link = "PmenuSel" }, -- Popup menu: Selected item "kind".
    PmenuExtra     = { link = "Pmenu" }, -- Popup menu: Normal item "extra text".
    PmenuExtraSel  = { link = "PmenuSel" }, -- Popup menu: Selected item "extra text".
    PmenuSbar      = { bg = C.base3 }, -- Popup menu: Scrollbar.
    PmenuThumb     = { bg = C.over0 }, -- Popup menu: Thumb of the scrollbar.
    Question       = { fg = C.blue }, -- |hit-enter| prompt and yes/no questions.
    Search         = { fg = C.text0, bg = C.yellow_back }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    QuickFixLine   = { link = "Search" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    SpecialKey     = { fg = C.over0 }, -- Unprintable characters: Text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad       = { sp = C.red, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap       = { sp = C.orange, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal     = { sp = C.text1, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare      = { sp = C.lime, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine     = { fg = C.text0, bg = C.base3 }, -- Status line of current window.
    StatusLineNC   = { fg = C.over2, bg = C.base3 }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine", Vim will use "^^^" in the status line of the current window.
    MsgSeparator   = { link = "StatusLine" }, -- Separator for scrolled messages |msgsep|.
    TabLine        = { fg = C.over2, bg = C.base2 }, -- Tab pages line, not active tab page label.
    TabLineFill    = { fg = C.over2, bg = C.base1 }, -- Tab pages line, where there are no labels.
    TabLineSel     = { link = "StatusLine" }, -- Tab pages line, active tab page label.
    Title          = { fg = C.text0, bold = true }, -- Titles for output from ":set all", ":autocmd" etc.
    FloatTitle     = { fg = C.text0, bold = true }, -- Title of floating windows.
    Visual         = { bg = C.base4, bold = true }, -- Visual mode selection.
    VisualNOS      = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg     = { fg = C.yellow }, -- Warning messages.
    Whitespace     = { fg = C.base4 }, -- "nbsp", "space", "tab", "multispace", "lead" and "trail" in 'listchars'.
    WildMenu       = { link = "PmenuSel" }, -- Current match in 'wildmenu' completion.
    WinBar         = { fg = C.over0, bold = true }, -- Window bar of current window.
    WinBarNC       = { fg = C.over1 }, -- Window bar of not-current windows.
  }
end

return M
