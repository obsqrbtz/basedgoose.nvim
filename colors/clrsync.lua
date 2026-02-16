vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.g.colors_name = "clrsync"

local palette = {
    -- General UI
    bg = "#0F0F1E",
    bg_alt = "#22223B",
    fg = "#D2D2D2",
    fg_alt = "#C9ADA7",
    grey = "#9A8C98",

    -- Accent / keyword colors
    blue = "#3A898C",
    cyan = "#3A898C",
    violet = "#9A8C98",
    magenta = "#B0779E",
    orange = "#B47837",
    yellow = "#D4C87D",
    green = "#7EC87E",
    red = "#D16C8B",

    -- Editor - Basic
    cursor = "#F2E9E4",
    selection = "#242424",
    dark_blue = "#242424",
    line_highlight = "#191919",

    -- Editor - Gutter
    line_number = "#9A8C98",
    line_number_active = "#D2D2D2",

    -- Editor - Syntax
    comment = "#4A4E69",
    string = "#C9ADA7",
    number = "#B47837",
    boolean = "#B47837",
    keyword = "#3A898C",
    operator = "#D2D2D2",
    function_ = "#A9DC86",
    variable = "#D2D2D2",
    parameter = "#B0779E",
    property = "#9A8652",
    constant = "#B47837",
    type_ = "#3A898C",
    tag = "#AA4E4A",
    punctuation = "#D2D2D2",
    link = "#9A8C98",
    regex = "#AA477B",
    attribute = "#A9DC86",
    decorator = "#A9DC86",
    escape_char = "#B47837",

    -- Editor - UI
    border = "#4A4E69",
    indent_guide = "#2A2A2A",
    search_match = "#9A8652",
    search_match_active = "#9A8652",
    bracket_match = "#3A898C",
    whitespace = "#3A3A3A",

    -- Editor - Diagnostics
    error_fg = "#D16C8B",
    warning_fg = "#D4C87D",
    info_fg = "#3A898C",
    hint_fg = "#668A51",

    -- Editor - Diff
    diff_add = "#668A51",
    diff_change = "#9A8652",
    diff_delete = "#AA4E4A",

    -- Semantic
    success = "#7EC87E",
    warning = "#D4C87D",
    error = "#D16C8B",
    info = "#9A8C98",

    -- Base (terminal / muted)
    base0 = "#0F0F1E",
    base1 = "#1A1A2E",
    base2 = "#22223B",
    base3 = "#22223B",
    base4 = "#9A8C98",
    base5 = "#4A4E69",
    base6 = "#9A8C98",
    base7 = "#C9ADA7",
    base8 = "#F2E9E4",
}

local function set_hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

vim.o.winborder = "rounded"

--- General UI
set_hl("Normal", { bg = palette.bg, fg = palette.fg })
set_hl("NormalFloat", { bg = palette.bg, fg = palette.fg })
set_hl("NormalBorder", { bg = palette.bg, fg = palette.fg })
set_hl("EndOfBuffer", { bg = palette.bg, fg = palette.bg })

set_hl("Visual", { bg = palette.dark_blue })
set_hl("VisualBold", { bg = palette.dark_blue, bold = true })

set_hl("LineNr", { bg = palette.bg, fg = palette.grey })
set_hl("Cursor", { bg = palette.blue })
set_hl("CursorLine", { bg = palette.bg_alt })
set_hl("CursorLineNr", { bg = palette.bg_alt, fg = palette.fg })
set_hl("CursorColumn", { bg = palette.bg_alt })

set_hl("Folded", { bg = palette.bg_alt, fg = palette.base5 })
set_hl("FoldColumn", { bg = palette.bg, fg = palette.fg_alt })
set_hl("SignColumn", { bg = palette.bg })
set_hl("ColorColumn", { bg = palette.bg_alt })

set_hl("IndentGuide", { fg = palette.indent_guide })
set_hl("IndentGuideEven", { link = "IndentGuide" })
set_hl("IndentGuideOdd", { link = "IndentGuide" })

set_hl("TermCursor", { fg = palette.fg, reverse = true })
set_hl("TermCursorNC", { fg = palette.fg_alt, reverse = true })
set_hl("TermNormal", { link = "Normal" })
set_hl("TermNormalNC", { link = "TermNormal" })

set_hl("WildMenu", { bg = palette.dark_blue, fg = palette.fg })
set_hl("Separator", { fg = palette.fg_alt })
set_hl("VertSplit", { bg = palette.bg, fg = palette.grey })

set_hl("TabLine", { bg = palette.bg_alt, fg = palette.base7, bold = true })
set_hl("TabLineSel", { bg = palette.bg, fg = palette.blue, bold = true })
set_hl("TabLineFill", { bg = palette.base1, bold = true })

set_hl("StatusLine", { bg = palette.base3, fg = palette.base8 })
set_hl("StatusLineNC", { bg = palette.bg_alt, fg = palette.base6 })
set_hl("StatusLinePart", { bg = palette.bg_alt, fg = palette.base6, bold = true })
set_hl("StatusLinePartNC", { link = "StatusLinePart" })

set_hl("Pmenu", { bg = palette.bg_alt, fg = palette.fg })
set_hl("PmenuSel", { bg = palette.blue, fg = palette.base0 })
set_hl("PmenuSelBold", { bg = palette.blue, fg = palette.base0, bold = true })
set_hl("PmenuSbar", { bg = palette.bg_alt })
set_hl("PmenuThumb", { bg = palette.grey })

set_hl("FloatBorder", { fg = palette.border, bg = palette.bg })

--- Search, Highlight, Conceal
set_hl("Search", { bg = palette.dark_blue, fg = palette.fg })
set_hl("Substitute", { fg = palette.red, bold = true, strikethrough = true })
set_hl("IncSearch", { bg = palette.yellow, fg = palette.bg, bold = true })
set_hl("IncSearchCursor", { reverse = true })

set_hl("Conceal", { fg = palette.grey })
set_hl("SpecialKey", { fg = palette.violet, bold = true })
set_hl("NonText", { fg = palette.fg_alt, bold = true })
set_hl("MatchParen", { fg = palette.red, bold = true })
set_hl("Whitespace", { fg = palette.whitespace })

set_hl("Highlight", { bg = palette.bg_alt })
set_hl("HighlightSubtle", { link = "Highlight" })

set_hl("Question", { fg = palette.green, bold = true })

set_hl("File", { fg = palette.fg })
set_hl("Directory", { fg = palette.violet, bold = true })
set_hl("Title", { fg = palette.violet, bold = true })

set_hl("Bold", { bold = true })
set_hl("Emphasis", { italic = true })

--- Messages
set_hl("Msg", { fg = palette.green })
set_hl("MoreMsg", { fg = palette.blue })
set_hl("WarningMsg", { fg = palette.yellow })
set_hl("Error", { fg = palette.red })
set_hl("ErrorMsg", { fg = palette.red })
set_hl("ModeMsg", { fg = palette.violet })
set_hl("Todo", { fg = palette.yellow, bold = true })

set_hl("healthError", { link = "ErrorMsg" })
set_hl("healthSuccess", { link = "Msg" })
set_hl("healthWarning", { link = "WarningMsg" })

--- Syntax
set_hl("Tag", { fg = palette.cyan, bold = true })
set_hl("Link", { fg = palette.green, underline = true })
set_hl("URL", { link = "Link" })
set_hl("Underlined", { fg = palette.cyan, underline = true })

set_hl("Comment", { fg = palette.comment, italic = true })
set_hl("CommentBold", { fg = palette.comment, bold = true })
set_hl("SpecialComment", { fg = palette.base7, bold = true })

set_hl("Macro", { fg = palette.violet })
set_hl("Define", { fg = palette.violet, bold = true })
set_hl("Include", { fg = palette.violet, bold = true })
set_hl("PreProc", { fg = palette.violet, bold = true })
set_hl("PreCondit", { fg = palette.violet, bold = true })

set_hl("Label", { fg = palette.blue })
set_hl("Repeat", { fg = palette.blue })
set_hl("Keyword", { fg = palette.blue })
set_hl("Operator", { fg = palette.operator })
set_hl("Delimiter", { fg = palette.blue })
set_hl("Statement", { fg = palette.blue })
set_hl("Exception", { fg = palette.blue })
set_hl("Conditional", { fg = palette.blue })

set_hl("Variable", { fg = palette.variable })
set_hl("VariableBuiltin", { fg = palette.magenta, bold = true })
set_hl("Constant", { fg = palette.violet, bold = true })

set_hl("Number", { fg = palette.orange })
set_hl("Float", { link = "Number" })
set_hl("Boolean", { fg = palette.orange, bold = true })
set_hl("Enum", { fg = palette.orange })

set_hl("Character", { fg = palette.violet, bold = true })
set_hl("SpecialChar", { fg = palette.violet, bold = true })
set_hl("String", { fg = palette.green })
set_hl("StringDelimiter", { link = "String" })

set_hl("Special", { fg = palette.violet })
set_hl("SpecialBold", { fg = palette.violet, bold = true })

set_hl("Field", { fg = palette.violet })
set_hl("Argument", { fg = palette.parameter })
set_hl("Attribute", { fg = palette.attribute })
set_hl("Identifier", { fg = palette.variable })
set_hl("Property", { fg = palette.property })
set_hl("Function", { fg = palette.function_ })
set_hl("FunctionBuiltin", { fg = palette.function_, bold = true })
set_hl("KeywordFunction", { fg = palette.blue, bold = true })
set_hl("Method", { fg = palette.function_ })

set_hl("Type", { fg = palette.type_ })
set_hl("Typedef", { fg = palette.blue })
set_hl("TypeBuiltin", { fg = palette.type_, bold = true })
set_hl("Class", { fg = palette.blue })
set_hl("StorageClass", { fg = palette.blue })
set_hl("Structure", { fg = palette.blue })

set_hl("Regexp", { fg = palette.regex })
set_hl("RegexpSpecial", { fg = palette.regex })
set_hl("RegexpDelimiter", { fg = palette.regex, bold = true })
set_hl("RegexpKey", { fg = palette.regex, bold = true })

set_hl("CommentURL", { link = "URL" })
set_hl("CommentLabel", { link = "CommentBold" })
set_hl("CommentSection", { link = "CommentBold" })
set_hl("Noise", { link = "Comment" })

--- Diff
set_hl("DiffAddedGutter", { fg = palette.green, bold = true })
set_hl("DiffModifiedGutter", { fg = palette.orange, bold = true })
set_hl("DiffRemovedGutter", { fg = palette.red, bold = true })

set_hl("DiffAdd", { link = "DiffAddedGutter" })
set_hl("DiffChange", { link = "DiffModifiedGutter" })
set_hl("DiffDelete", { link = "DiffRemovedGutter" })

set_hl("diffAdded", { fg = palette.green, bg = palette.bg_alt })
set_hl("diffChanged", { fg = palette.violet })
set_hl("diffRemoved", { fg = palette.red, bg = palette.base3 })
set_hl("diffLine", { fg = palette.violet })
set_hl("diffIndexLine", { fg = palette.cyan })
set_hl("diffSubname", { fg = palette.cyan })
set_hl("diffFile", { fg = palette.cyan })
set_hl("diffOldFile", { fg = palette.blue })
set_hl("diffNewFile", { fg = palette.blue })

--- Markdown
set_hl("markdownCode", { link = "Comment" })
set_hl("markdownCodeBlock", { link = "markdownCode" })
set_hl("markdownH1", { bold = true })
set_hl("markdownH2", { bold = true })
set_hl("markdownLinkText", { underline = true })

--- LSP / Diagnostics
set_hl("LspHighlight", { bg = palette.bg_alt, bold = true })
set_hl("LspSignatureActiveParameter", { fg = palette.violet })

set_hl("DiagnosticError", { fg = palette.error })
set_hl("DiagnosticWarn", { fg = palette.warning })
set_hl("DiagnosticInfo", { fg = palette.info })
set_hl("DiagnosticHint", { fg = palette.hint_fg })
set_hl("DiagnosticFloatingError", { link = "ErrorMsg" })
set_hl("DiagnosticFloatingWarn", { link = "WarningMsg" })
set_hl("DiagnosticFloatingInfo", { link = "MoreMsg" })
set_hl("DiagnosticFloatingHint", { link = "Msg" })
set_hl("DiagnosticDefaultError", { link = "ErrorMsg" })
set_hl("DiagnosticDefaultWarn", { link = "WarningMsg" })
set_hl("DiagnosticDefaultInfo", { link = "MoreMsg" })
set_hl("DiagnosticDefaultHint", { link = "Msg" })
set_hl("DiagnosticVirtualTextError", { link = "ErrorMsg" })
set_hl("DiagnosticVirtualTextWarn", { link = "WarningMsg" })
set_hl("DiagnosticVirtualTextInfo", { link = "MoreMsg" })
set_hl("DiagnosticVirtualTextHint", { link = "Msg" })
set_hl("DiagnosticSignError", { link = "ErrorMsg" })
set_hl("DiagnosticSignWarning", { link = "WarningMsg" })
set_hl("DiagnosticSignInformation", { link = "MoreMsg" })
set_hl("DiagnosticSignHint", { link = "Msg" })

set_hl("LspReferenceText", { link = "LspHighlight" })
set_hl("LspReferenceRead", { link = "LspHighlight" })
set_hl("LspReferenceWrite", { link = "LspHighlight" })

--- Tree-Sitter
set_hl("@annotation", { link = "PreProc" })
set_hl("@attribute", { link = "Attribute" })
set_hl("@conditional", { link = "Conditional" })
set_hl("@comment", { link = "Comment" })
set_hl("@constructor", { link = "Structure" })
set_hl("@constant", { link = "Constant" })
set_hl("@constant.builtin", { link = "Constant" })
set_hl("@constant.macro", { link = "Macro" })
set_hl("@error", { link = "Error" })
set_hl("@exception", { link = "Exception" })
set_hl("@field", { link = "Field" })
set_hl("@float", { link = "Float" })
set_hl("@function", { link = "Function" })
set_hl("@function.builtin", { link = "FunctionBuiltin" })
set_hl("@function.macro", { link = "Macro" })
set_hl("@include", { link = "Include" })
set_hl("@keyword", { link = "Keyword" })
set_hl("@keyword.function", { link = "KeywordFunction" })
set_hl("@label", { link = "Label" })
set_hl("@math", { link = "Special" })
set_hl("@method", { link = "Method" })
set_hl("@namespace", { link = "Directory" })
set_hl("@number", { link = "Number" })
set_hl("@boolean", { link = "Boolean" })
set_hl("@operator", { link = "Operator" })
set_hl("@parameter", { link = "Argument" })
set_hl("@parameter.reference", { link = "Argument" })
set_hl("@property", { link = "Property" })
set_hl("@punctuation.delimiter", { link = "Delimiter" })
set_hl("@punctuation.bracket", { link = "Delimiter" })
set_hl("@punctuation.special", { link = "Delimiter" })
set_hl("@repeat", { link = "Repeat" })
set_hl("@string", { link = "String" })
set_hl("@string.regex", { link = "StringDelimiter" })
set_hl("@string.escape", { link = "StringDelimiter" })
set_hl("@structure", { link = "Structure" })
set_hl("@tag", { link = "Tag" })
set_hl("@tag.attribute", { link = "Attribute" })
set_hl("@tag.delimiter", { link = "Delimiter" })
set_hl("@strong", { link = "Bold" })
set_hl("@uri", { link = "URL" })
set_hl("@warning", { link = "WarningMsg" })
set_hl("@danger", { link = "ErrorMsg" })
set_hl("@type", { link = "Type" })
set_hl("@type.builtin", { link = "TypeBuiltin" })
set_hl("@variable", { fg = palette.variable })
set_hl("@variable.builtin", { link = "VariableBuiltin" })
set_hl("@text", { link = "Normal" })
set_hl("@text.strong", { fg = palette.fg, bold = true })
set_hl("@text.emphasis", { link = "Emphasis" })
set_hl("@text.underline", { underline = true })
set_hl("@text.title", { link = "Title" })
set_hl("@text.uri", { link = "URL" })
set_hl("@text.note", { link = "MoreMsg" })
set_hl("@text.warning", { link = "WarningMsg" })
set_hl("@text.danger", { link = "ErrorMsg" })
set_hl("@todo", { link = "Todo" })

--- NetRW
set_hl("netrwClassify", { fg = palette.blue })
set_hl("netrwDir", { link = "Directory" })
set_hl("netrwExe", { fg = palette.green, bold = true })
set_hl("netrwMakefile", { fg = palette.yellow, bold = true })
set_hl("netrwTreeBar", { link = "Comment" })
