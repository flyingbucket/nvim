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
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_latexmk = {
            executable = "latexmk",
            options = {
                "-xelatex", -- ✅ 用 xelatex
                "-verbose",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
            },
        }
        vim.g.maplocalleader = "," -- 设置 localleader
    end,
}
