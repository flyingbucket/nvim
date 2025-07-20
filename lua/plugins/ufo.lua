return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
    },
    event = "BufReadPost", -- 启动时机
    config = function()
        -- 基础设置
        vim.o.foldcolumn = "1" -- 显示折叠列
        vim.o.foldlevel = 99 -- 折叠层级设置为最大
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true -- 启用折叠

        -- 快捷键绑定
        vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })

        -- 使用 Treesitter 和 indent 作为 provider
        require("ufo").setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" }
            end,
        })
    end,
}
