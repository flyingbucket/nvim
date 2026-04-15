-- td_metal_archspire.nvim
-- A tech-death music inspired scheme
-- capturing the sharp, precise, and aggressive essence of Archspire.
-- It pairs industrial cold tones with piercing
-- "Electric Blood" accents for high-velocity technical clarity.

local M = {}

local c = {
    -- Core UI
    fg = "#d4d1c8", -- soft white
    bg = "#070b12", -- dark abyss
    cursor = "#9ad4a8", -- mint frost
    sel_bg = "#263345", -- steel blue

    -- Syntax specifics
    comment = "#5c6a72", -- iron gray

    -- ANSI 0-7
    black = "#000000", -- black
    a1 = "#63b0b0", -- cyan gray
    a2 = "#c3cf88", -- muted lime
    a3 = "#d7e27a", -- lemon yellow
    a4 = "#9fb4fc", -- titanium blue
    a5 = "#e06c75", -- electric blood red
    a6 = "#8fd0d0", -- light cyan
    white = "#d6d6d6", -- silver gray

    -- Brights 8-15
    bblack = "#555555", -- medium gray
    b1 = "#79c6c6", -- bright cyan
    b2 = "#9ad4a8", -- bright mint
    b3 = "#e5f08f", -- bright yellow
    b4 = "#c2d1ff", -- laser blue
    b5 = "#ff8e95", -- fresh blood red
    b6 = "#b2e6e6", -- electric cyan
    bwhite = "#f2f2f2", -- bright white
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

    -- Make :terminal and any TUI-based highlight obey this palette
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
    hi("Visual", { bg = c.sel_bg, bold = true })
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

    -- Diagnostics
    hi("DiagnosticError", { fg = c.a5 })
    hi("DiagnosticWarn", { fg = c.a3 })
    hi("DiagnosticInfo", { fg = c.a4 })
    hi("DiagnosticHint", { fg = c.a6 })

    -- Syntax (classic groups; treesitter/LSP also map into these often)
    hi("Comment", { fg = c.comment, italic = true })
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
    -- Common plugin groups
    hi("GitSignsAdd", { fg = c.a2 })
    hi("GitSignsChange", { fg = c.a3 })
    hi("GitSignsDelete", { fg = c.a1 })

    -- Telescope
    hi("TelescopeBorder", { fg = c.bblack, bg = c.bg })
    hi("TelescopeSelection", { bg = "#101010" })
    hi("TelescopeMatching", { fg = c.a3, bold = true })
end

M.setup()
return M
