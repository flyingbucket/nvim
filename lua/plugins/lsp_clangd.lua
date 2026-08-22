return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            clangd = {
                mason = false,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
                    "--pch-storage=disk",
                    "-j=4",
                },
            },
        },
    },
}
