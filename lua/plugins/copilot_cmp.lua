return {
    {
        "github/copilot.vim",
        event = "InsertEnter",
        init = function()
            -- 不用 Tab，避免和 cmp/snippets 冲突
            vim.g.copilot_no_tab_map = true

            -- 默认启用，但对某些类型禁用
            vim.g.copilot_filetypes = {
                ["*"] = true,
                gitcommit = false,
                markdown = false,
                help = false,
            }
        end,
        config = function()
            -- 接受建议
            vim.keymap.set("i", "<C-l>", 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false,
            })
            -- 下一条/上一条
            vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)")
            vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)")
            -- 取消
            vim.keymap.set("i", "<C-]>", "<Plug>(copilot-dismiss)")
        end,
    },
}
