return {
    -- 插件用于分片/兼容 tmux
    "ojroques/nvim-osc52",
    event = "VeryLazy",
    config = function()
        if not (vim.env.SSH_TTY or vim.env.SSH_CONNECTION) then
            return
        end

        local osc52 = require("osc52")
        osc52.setup({
            max_length = 0, -- 自动分片
            silent = true,
            trim = false,
        })

        -- 1) 保留 unnamedplus，让普通 y 仍写到 "+ 寄存器（不依赖它是否能“系统复制”）
        vim.opt.clipboard = "unnamedplus"

        -- 2) 在每次 y 之后，主动把 y 到的内容经 OSC52 送到本地剪贴板
        vim.api.nvim_create_autocmd("TextYankPost", {
            group = vim.api.nvim_create_augroup("osc52_yank", { clear = true }),
            callback = function()
                if vim.v.event.operator ~= "y" then
                    return
                end
                -- 1) 取这次 y 的寄存器；为空就用无名寄存器（"）
                local reg = (vim.v.event.regname == "" or vim.v.event.regname == nil) and '"' or vim.v.event.regname
                -- 2) 以“列表”的方式取（第三个参数 true），避免类型信息污染
                local lines = vim.fn.getreg(reg, 1, true) -- -> table of lines
                -- 3) 拼成纯文本；行末规则：如果本次是行模式（regtype = 'V'），则补一个结尾换行
                local text = table.concat(lines, "\n")
                local rt = vim.v.event.regtype or vim.fn.getregtype(reg)
                if rt == "V" and not text:match("\n$") then
                    text = text .. "\n"
                end
                -- 4) 直接送 OSC52（纯净 payload，不带类型/控制符）
                require("osc52").copy(text)
            end,
        })

        -- 3) （可选）仍然把 paste 定义为“回退到内部寄存器”，彻底杜绝 OSC52 读超时
        local function fallback_paste()
            -- 用无名寄存器（"）回退，避免去“读系统剪贴板”
            local reg = '"'
            local text = vim.fn.getreg(reg) -- 字符串
            local regtype = vim.fn.getregtype(reg) -- 可能是 'v'（charwise）或 'V'（linewise）等
            local lines = vim.split(text, "\n", true) -- 转为“行数组”，true=忽略空项裁剪行为

            -- 如果是行模式，通常寄存器末尾会带一个换行，按需要保留/裁剪
            -- (一般无需处理，保持默认)
            return { lines, regtype }
        end

        vim.g.clipboard = {
            name = "osc52 (copy-only, yank-hook)",
            copy = { ["+"] = osc52.copy, ["*"] = osc52.copy },
            paste = { ["+"] = fallback_paste, ["*"] = fallback_paste },
        }
        vim.schedule(function()
            vim.notify("[osc52] Yank hook active (SSH)", vim.log.levels.INFO)
        end)
    end,
}
