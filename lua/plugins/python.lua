-- return {
--     {
--         "neovim/nvim-lspconfig",
--         opts = {
--             servers = {
--                 pyright = {
--                 },
--             },
--         },
--     },
-- }

-- lua/plugins/python.lua
return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pyright = {
                    enabled = false,
                    settings = {
                        python = {
                            pythonPath = vim.fn.exepath("python"),
                        },
                    },
                },
                -- 声明 ty，让 LazyVim 知道该服务存在
                ty = {},
            },
            setup = {
                -- 拦截 ty 的默认启动逻辑，用 Neovim 0.11+ 原生 API 接管
                ty = function(_, opts)
                    -- 使用 Astral 官方推荐的原生配置方式
                    vim.lsp.config("ty", {
                        settings = {
                            ty = {
                                -- 在这里填入 ty 特定配置
                            },
                        },
                    })

                    -- 启用原生 ty
                    vim.lsp.enable("ty")

                    -- 【核心关键】：返回 true 告诉 LazyVim：
                    -- "我已经手动处理了 ty，请 lspconfig 不要再用旧的方式启动它了！"
                    return true
                end,
            },
        },
    },
}
