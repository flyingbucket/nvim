return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            clangd = {
                cmd = {
                    "clangd",
                    -- 以下是 LazyVim 官方原版的优秀默认参数
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
                    -- 以下是我们为了“拯救内存”手动追加的参数
                    -- 【核心降内存】将庞大的预编译头文件(如 catch.hpp 的 AST)缓存在硬盘而非内存
                    "--pch-storage=disk",
                    -- 【限制 CPU 飙升】限制后台解析的并发线程数，避免保存文件瞬间 CPU 占用 100% 卡顿
                    "-j=4",
                },
            },
        },
    },
}
