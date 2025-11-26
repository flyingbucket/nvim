-- ~/.config/nvim/lua/plugins/vimtex.lua
return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        -- ===== 1) 预览器 =====
        -- 你也可以改成 zathura/okular/sioyek，下面保留你原来的“系统默认”
        vim.g.vimtex_view_method = "general"
        vim.g.vimtex_view_general_viewer = "xdg-open"

        -- ===== 2) 编译器：latexmk + xelatex（强制）=====
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_compiler_latexmk = {
            executable = "latexmk",
            -- 设为 0：默认单次编译，不常驻 -pvc；需要连续编译再手动 \ll 开
            continuous = 0,
            options = {
                "-xelatex", -- 关键：引擎
                "-synctex=1",
                "-file-line-error",
                "-interaction=nonstopmode",
                "-bibtex",
                -- "-halt-on-error", -- 关键：遇到致命错误直接失败，不卡在 '?'
            },
        }
        -- 双保险：无论何种目标（_）都映射到 -xelatex
        vim.g.vimtex_compiler_latexmk_engines = { _ = "-xelatex" }

        -- ===== 3) Quickfix 过滤：不要忽略字体告警 =====
        -- （便于发现 Missing character / 字体 shape 未定义 等问题）
        vim.g.vimtex_quickfix_ignore_filters = {
            "Underfull \\\\hbox",
            "Overfull \\\\hbox",
            "Label%(s%) may have changed%. Rerun",
            "Citation `.*' undefined",
            "Package fancyhdr Warning: \\\\headheight is too small",
            "fancyhead's `E' option without twoside option is useless",
            -- 删掉 "LaTeX Font Warning"
        }

        -- ===== 4) 进度与完成提示：自动开关编译输出窗 =====
        -- 需要 vimtex 0.0.22+（常见发行版都够）
        local aug = vim.api.nvim_create_augroup("VimtexProgress", { clear = true })

        -- 开始编译时自动打开输出（看进度）
        vim.api.nvim_create_autocmd("User", {
            group = aug,
            pattern = "VimtexEventCompileStarted",
            callback = function()
                vim.cmd("VimtexCompileOutput")
            end,
        })

        -- 编译成功后自动关闭输出窗（你也可以注释掉这段，保留日志）
        vim.api.nvim_create_autocmd("User", {
            group = aug,
            pattern = "VimtexEventCompileSuccess",
            callback = function()
                pcall(vim.cmd, "cclose | lclose | pclose")
            end,
        })

        -- 失败时保留输出窗并跳到第一条错误
        vim.api.nvim_create_autocmd("User", {
            group = aug,
            pattern = "VimtexEventCompileFailed",
            callback = function()
                vim.cmd("copen | cfirst")
            end,
        })

        -- 本地 leader
        vim.g.maplocalleader = ","
    end,
}
