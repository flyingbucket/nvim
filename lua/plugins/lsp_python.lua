return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pyright = {
                    enabled = false,
                },
                -- 声明 ty 并禁用 Mason 自动安装
                ty = {
                    mason = false,
                },
                -- 手动配置 ruff
                ruff = {
                    mason = false, -- 阻止 Mason 自动下载 ruff，直接使用系统/uv 中的 ruff
                    cmd = { "ruff", "server" },
                    init_options = {
                        settings = {},
                    },
                    keys = {
                        {
                            "<leader>co",
                            LazyVim.lsp.action["source.organizeImports"],
                            desc = "Organize Imports",
                        },
                    },
                },
            },
            setup = {
                ty = function(_, opts)
                    vim.lsp.config("ty", {
                        settings = {
                            ty = {},
                        },
                    })
                    vim.lsp.enable("ty")
                    return true
                end,
            },
        },
    },
}
