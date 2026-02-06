return {
    -- 不需要插件：直接用 Neovim 内置的 vim.ui.clipboard.osc52
    {
        "neovim/nvim-lspconfig", -- 只是为了挂到 Lazy 体系里，随便一个常驻插件也行
        optional = true,
        init = function()
            -- 只在 SSH 环境启用
            if not (vim.env.SSH_TTY or vim.env.SSH_CONNECTION) then
                return
            end

            vim.g.clipboard = {
                name = "OSC52",
                copy = {
                    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
                    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
                },
                paste = {
                    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
                    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
                },
            }

            -- 让 y/p 默认用系统剪贴板
            vim.opt.clipboard = "unnamedplus"
        end,
    },
}
