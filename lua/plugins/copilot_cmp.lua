return {
    "github/copilot.vim",
    -- 删掉 event = "InsertEnter"
    cmd = "Copilot", -- 当你手动输入 :Copilot 命令时加载
    keys = {
        -- 将触发按键配置在这里，只有按下时才会真正加载插件并拉起 Node 进程
        {
            "<leader>tc",
            function()
                -- 插件未加载时按下会先加载插件，然后再执行这里的逻辑
                -- 使用 Copilot 内部函数来准确判断当前状态
                if vim.fn["copilot#Enabled"]() == 1 then
                    vim.cmd("Copilot disable")
                    print("Copilot Disabled")
                else
                    vim.cmd("Copilot enable")
                    print("Copilot Enabled")
                end
            end,
            desc = "Toggle Copilot",
        },
    },
    init = function()
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_filetypes = {
            ["*"] = true,
            gitcommit = false,
            help = false,
        }
    end,
    config = function()
        -- 插件加载后，再绑定这些只能在插入模式用的按键
        vim.keymap.set("i", "<C-l>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
        vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)")
        vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)")
        vim.keymap.set("i", "<C-]>", "<Plug>(copilot-dismiss)")
    end,
}
