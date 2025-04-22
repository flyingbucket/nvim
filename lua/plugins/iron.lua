-- ~/.config/nvim/lua/plugins/iron.lua
return {
    "Vigemus/iron.nvim",
    config = function()
        require("iron.core").setup({
            config = {
                repl_definition = {

                    python = {
                        command = { "ipython", "--no-autoindent" },
                        format = require("iron.fts.common").bracketed_paste_python,
                    },
                },
                repl_open_cmd = require("iron.view").split.vertical.botright("40%"),
            },
            keymaps = {
                send_motion = "<leader>sc",
                visual_send = "<leader>sv",
                send_file = "<leader>sf",
                send_line = "<leader>sl",
                send_mark = "<leader>sm",
                mark_motion = "<leader>mc",
                mark_visual = "<leader>mc",
                remove_mark = "<leader>md",
                cr = "<leader>s<cr>",
                interrupt = "<leader>s<space>",
                exit = "<leader>sq",
                clear = "<leader>cl",
            },
            highlight = {
                italic = true,
            },
            ignore_blank_lines = true,
        })
    end,
}
