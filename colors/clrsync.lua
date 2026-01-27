vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.g.colors_name = "clrsync"

local palette = {
    -- Editor colors
    Default                 = "#F2E9E4",
    Keyword                 = "#9A8C98",
    Number                  = "#D4C87D",
    String                  = "#C9ADA7",
    CharLiteral             = "#C9ADA7",
    Punctuation             = "#F2E9E4",
    Preprocessor            = "#C9ADA7",
    Identifier              = "#F2E9E4",
    KnownIdentifier         = "#9A8C98",
    PreprocIdentifier       = "#9A8C98",

    Comment                 = "#4A4E69",
    MultiLineComment        = "#4A4E69",

    Background              = "#0F0F1E",
    Cursor                  = "#F2E9E4",

    Selection               = "#9A8C98",
    ErrorMarker             = "#D16C8B",
    Breakpoint              = "#D16C8B",

    LineNumber              = "#9A8C98",
    CurrentLineFill         = "#22223B",
    CurrentLineFillInactive = "#1A1A2E",

    CurrentLineEdge         = "#4A4E69",
    
    -- Semantic colors
    Success                 = "#7EC87E",
    Warning                 = "#D4C87D",
    Error                   = "#D16C8B",
    Info                    = "#9A8C98",
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