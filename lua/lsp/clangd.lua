local lspconfig = require("lspconfig")
lspconfig.clangd.setup({
    cmd = { "~/.local/share/nvim/mason/bin/clangd" }, -- 去掉多余的选项，简化启动
    filetypes = { "c", "cpp", "cuda" },
    init_options = {
        clangdFileStatus = true,
    },
})
