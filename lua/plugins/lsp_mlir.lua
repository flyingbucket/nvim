return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                mlir_lsp_server = {
                    mason = false,
                    cmd = { vim.fn.expand("$HOME") .. "/sdk/mlir/bin/mlir-lsp-server" },
                    filetypes = { "mlir" },
                    root_dir = function(fname)
                        local lspconfig = require("lspconfig")
                        return lspconfig.util.root_pattern("CMakeLists.txt", ".git")(fname)
                            or lspconfig.util.path.dirname(fname)
                    end,
                },
            },
            -- 防止 Mason 拦截并报 No LSP servers found 错误
            setup = {
                mlir_lsp_server = function(_, opts)
                    require("lspconfig").mlir_lsp_server.setup(opts)
                    return true -- 返回 true 阻止 LazyVim/Mason 进行二次默认初始化
                end,
            },
        },
    },
}
