-- td_metal_archspire.nvim
-- A cool, technical-death-metal inspired scheme based on your WezTerm palette.

local M = {}

local c = {
    fg = "#d4d1c8",
    -- bg = "#000000",
    bg = "#070b12",
    cursor = "#9ad4a8",
    sel_bg = "#2a2a2a",
    sel_fg = "#c1c1c1",

    -- ansi 0-7
    black = "#000000",
    a1 = "#63b0b0", -- cyan-gray (slot 1)
    a2 = "#c3cf88", -- muted lime (slot 2)
    a3 = "#d7e27a", -- lemon (slot 3)
    a4 = "#6f9bc9", -- blue-gray (slot 4)
    a5 = "#b4a6d6", -- violet (slot 5)
    a6 = "#8fd0d0", -- light cyan (slot 6)
    white = "#d6d6d6",

    -- brights 8-15
    bblack = "#555555",
    b1 = "#79c6c6",
    b2 = "#9ad4a8",
    b3 = "#e5f08f",
    b4 = "#90b4e6",
    b5 = "#cbbaf2",
    b6 = "#b2e6e6",
    bwhite = "#f2f2f2",
}

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
    -- Required boilerplate
    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end
    vim.o.termguicolors = true
    vim.g.colors_name = "td_metal_archspire"

    -- Make :terminal and any TUI-based highlight obey your palette
    vim.g.terminal_color_0 = c.black
    vim.g.terminal_color_1 = c.a1
    vim.g.terminal_color_2 = c.a2
    vim.g.terminal_color_3 = c.a3
    vim.g.terminal_color_4 = c.a4
    vim.g.terminal_color_5 = c.a5
    vim.g.terminal_color_6 = c.a6
    vim.g.terminal_color_7 = c.white
    vim.g.terminal_color_8 = c.bblack
    vim.g.terminal_color_9 = c.b1
    vim.g.terminal_color_10 = c.b2
    vim.g.terminal_color_11 = c.b3
    vim.g.terminal_color_12 = c.b4
    vim.g.terminal_color_13 = c.b5
    vim.g.terminal_color_14 = c.b6
    vim.g.terminal_color_15 = c.bwhite

    -- Core UI
    hi("Normal", { fg = c.fg, bg = c.bg })
    hi("NormalFloat", { fg = c.fg, bg = c.bg })
    hi("FloatBorder", { fg = c.bblack, bg = c.bg })
    hi("Cursor", { fg = c.bg, bg = c.cursor })
    hi("CursorLine", { bg = "#101010" })
    hi("CursorColumn", { bg = "#101010" })
    hi("ColorColumn", { bg = "#101010" })
    hi("Visual", { fg = c.sel_fg, bg = c.sel_bg })
    hi("Search", { fg = c.bg, bg = c.a3 })
    hi("IncSearch", { fg = c.bg, bg = c.b3 })
    hi("LineNr", { fg = c.bblack })
    hi("CursorLineNr", { fg = c.bwhite, bold = true })
    hi("SignColumn", { fg = c.fg, bg = c.bg })
    hi("VertSplit", { fg = c.bblack })
    hi("StatusLine", { fg = c.fg, bg = "#0b0b0b" })
    hi("StatusLineNC", { fg = c.bblack, bg = "#0b0b0b" })
    hi("Pmenu", { fg = c.fg, bg = "#0b0b0b" })
    hi("PmenuSel", { fg = c.bg, bg = c.a4 })
    hi("PmenuSbar", { bg = "#0b0b0b" })
    hi("PmenuThumb", { bg = c.bblack })

    -- Diagnostics (cool, not bloody)
    hi("DiagnosticError", { fg = c.a1 }) -- keep “error” cold
    hi("DiagnosticWarn", { fg = c.a3 })
    hi("DiagnosticInfo", { fg = c.a4 })
    hi("DiagnosticHint", { fg = c.a6 })

    -- Syntax (classic groups; treesitter/LSP also map into these often)
    hi("Comment", { fg = c.bblack, italic = true })
    hi("String", { fg = c.a2 })
    hi("Character", { fg = c.a2 })
    hi("Number", { fg = c.a3 })
    hi("Boolean", { fg = c.a3 })
    hi("Float", { fg = c.a3 })
    hi("Identifier", { fg = c.fg })
    hi("Function", { fg = c.a4 })
    hi("Statement", { fg = c.a6 })
    hi("Keyword", { fg = c.a6 })
    hi("Operator", { fg = c.fg })
    hi("Type", { fg = c.a5 })
    hi("Constant", { fg = c.a3 })
    hi("PreProc", { fg = c.a6 })
    hi("Special", { fg = c.a1 })
    hi("Todo", { fg = c.bg, bg = c.a3, bold = true })

    -- Common plugin groups (nice-to-have)
    hi("GitSignsAdd", { fg = c.a2 })
    hi("GitSignsChange", { fg = c.a3 })
    hi("GitSignsDelete", { fg = c.a1 })

    -- Telescope (if you use it)
    hi("TelescopeBorder", { fg = c.bblack, bg = c.bg })
    hi("TelescopeSelection", { bg = "#101010" })
    hi("TelescopeMatching", { fg = c.a3, bold = true })
end

M.setup()
return M
