return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
            model = "claude-opus-4.5", -- 默认使用的 Copilot 模型
            temperature = 0.1, -- 输出创意程度：越低越集中
            auto_insert_mode = true, -- 打开会自动进入 insert 模式
            show_help = true, -- 显示底部提示
            window = {
                layout = "float", -- 弹窗布局，可选 "vertical" / "horizontal" / "float"
                width = 0.7, -- 宽度为 50%
                height = 0.6, -- 高度 40%
                border = "rounded", -- 边框样式：'single','double','rounded'
                title = "Copilot", -- 窗口标题
                zindex = 50,
            },
            headers = {
                user = "YOU",
                assistant = "COPILOT",
                tool = "TOOL",
            },
            separator = "━━━", -- 聊天消息分隔符
        },
        keys = {
            -- 快速打开聊天窗口
            { "<leader>co", "<cmd>CopilotChatOpen<cr>", desc = "CopilotChat - Open" },
            { "<leader>cq", "<cmd>CopilotChatClose<cr>", desc = "CopilotChat - Close" },
            { "<leader>ct", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
            { "<leader>cr", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Reset" },

            -- 针对选中的代码进行操作 (Visual Mode)
            {
                " <leader>ce",
                "<cmd>CopilotChatExplain<cr>",
                mode = "v",
                desc = "CopilotChat - Explain code",
            },
            {
                "<leader>cf",
                "<cmd>CopilotChatFix<cr>",
                mode = "v",
                desc = "CopilotChat - Fix code",
            },
            {
                "<leader>co",
                "<cmd>CopilotChatOptimize<cr>",
                mode = "v",
                desc = "CopilotChat - Optimize code",
            },
            {
                "<leader>cd",
                "<cmd>CopilotChatDocs<cr>",
                mode = "v",
                desc = "CopilotChat - Write documentation",
            },
            -- 自由提问
            {
                "<leader>cp",
                function()
                    local input = vim.fn.input("Quick Chat: ")
                    if input ~= "" then
                        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
                    end
                end,
                desc = "CopilotChat - Quick chat",
            },
        },
        -- opts = {
        --     -- See Configuration section for options
        -- },
    },
}
