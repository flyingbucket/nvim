-- return {
--     "lervag/vimtex",
--     lazy = false,
--     init = function()
--         -- 设置 vimtex 使用 latexmk
--         vim.g.vimtex_view_method = "zathura" -- 或者 "sioyek"、"skim" 取决于你的 PDF 阅读器
--         -- vim.g.vimtex_compiler_method = "xelatex"
--         vim.g.vimtex_compiler_latexmk = {
--             executable = "latexmk",
--             options = {
--                 "-xelatex",
--                 "-verbose",
--                 "-file-line-error",
--                 "-synctex=1",
--                 "-interaction=nonstopmode",
--             },
--         }
--     end,
-- }
--

-- ~/.config/nvim/lua/plugins/vimtex.lua
return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        -- vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_view_method = "general"
        vim.g.vimtex_view_general_viewer = "xdg-open" -- 交给系统默认浏览器
        vim.g.vimtex_compiler_latexmk = {
            executable = "latexmk",
            options = {
                "-xelatex",
                "-verbose",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
            },
        }

        -- 不把“常见无害警告”塞进 quickfix（注意只是忽略显示，不掩盖真错）
        vim.g.vimtex_quickfix_ignore_filters = {
            "Underfull \\hbox",
            "Overfull \\hbox",
            "Package caption Warning: Unknown document class",
            "LaTeX Font Warning",
            "Label%(s%) may have changed%. Rerun", -- 首轮常见
            "Citation `.*' undefined", -- 首轮常见（bibtex 后会消失）
            "Package fancyhdr Warning: \\\\headheight is too small",
            "fancyhead's `E' option without twoside option is useless",
        }

        vim.g.maplocalleader = "," -- 设置 localleader
    end,
}
