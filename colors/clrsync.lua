vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.g.colors_name = "clrsync"

local palette = {
    -- Editor colors
    Default                 = "#C2C2B0",
    Keyword                 = "#CEB34F",
    Number                  = "#E1C135",
    String                  = "#76C39B",
    CharLiteral             = "#76C39B",
    Punctuation             = "#C2C2B0",
    Preprocessor            = "#DC7671",
    Identifier              = "#C2C2B0",
    KnownIdentifier         = "#60928F",
    PreprocIdentifier       = "#60928F",

    Comment                 = "#3F3639",
    MultiLineComment        = "#3F3639",

    Background              = "#151515",
    Cursor                  = "#E1C135",

    Selection               = "#3F3639",
    ErrorMarker             = "#B44242",
    Breakpoint              = "#B44242",

    LineNumber              = "#86596C",
    CurrentLineFill         = "#1C1C1C",
    CurrentLineFillInactive = "#1C1C1C",

    CurrentLineEdge         = "#E1C135",
    
    -- Semantic colors
    Success                 = "#95A328",
    Warning                 = "#E1C135",
    Error                   = "#B44242",
    Info                    = "#60928F",
}

-- Helper function to set highlights in Neovim
local function set_hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

vim.o.winborder = "rounded"

-- Basic editor highlights using the mapped palette
set_hl("Normal", { fg = palette.Default, bg = palette.Background })
set_hl("CursorLine", { bg = palette.CurrentLineFill })
set_hl("Visual", { bg = palette.Selection })
set_hl("LineNr", { fg = palette.LineNumber })
set_hl("CursorLineNr", { fg = palette.Keyword })

-- Syntax highlights
set_hl("Comment", { fg = palette.Comment, italic = true })
set_hl("Constant", { fg = palette.Number })
set_hl("String", { fg = palette.String })
set_hl("Character", { fg = palette.CharLiteral })
set_hl("Identifier", { fg = palette.Identifier })
set_hl("Function", { fg = palette.Keyword })
set_hl("Statement", { fg = palette.Keyword })
set_hl("PreProc", { fg = palette.Preprocessor })
set_hl("Type", { fg = palette.Keyword })
set_hl("Special", { fg = palette.PreprocIdentifier })
set_hl("Underlined", { fg = palette.KnownIdentifier })
set_hl("Error", { fg = palette.ErrorMarker, bg = palette.Background })
set_hl("Todo", { fg = palette.Default, bg = palette.Keyword })

-- Floating windows
set_hl("NormalFloat", { bg = palette.Background })
set_hl("FloatBorder", { fg = palette.CurrentLineEdge, bg = palette.Background })

-- Completion menu
set_hl("Pmenu", { bg = palette.Background })
set_hl("PmenuSel", { bg = palette.Keyword, fg = palette.Background })

-- Git and diagnostic highlights
set_hl("DiffAdd", { fg = palette.Success, bg = palette.Background })
set_hl("DiffChange", { fg = palette.Keyword, bg = palette.Background })
set_hl("DiffDelete", { fg = palette.ErrorMarker, bg = palette.Background })
set_hl("DiagnosticError", { fg = palette.Error })
set_hl("DiagnosticWarn", { fg = palette.Warning })
set_hl("DiagnosticInfo", { fg = palette.Info })
set_hl("DiagnosticHint", { fg = palette.PreprocIdentifier })

-- Treesitter links
set_hl("@comment", { link = "Comment" })
set_hl("@string", { fg = palette.String })
set_hl("@function", { fg = palette.Keyword })
set_hl("@variable", { fg = palette.Identifier })
set_hl("@keyword", { fg = palette.Keyword })
set_hl("@type", { fg = palette.Preprocessor })