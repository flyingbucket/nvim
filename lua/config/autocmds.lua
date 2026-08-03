-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

vim.opt.autoread = true

local auto_read_group = augroup("AutoReadCheck", { clear = true })

-- 当触发以下事件时，强制执行 checktime 检查磁盘文件状态：
-- 1. FocusGained: 终端/窗口重新获得焦点时
-- 2. BufEnter: 切换进入某个 buffer 时
-- 3. CursorHold / CursorHoldI: 光标停止移动一段时间后（默认 4000ms，取决于 updatetime）
-- 4. TermClose: 内置终端关闭时（例如在 nvim 内运行了外部脚本）
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI", "TermClose" }, {
    group = auto_read_group,
    callback = function()
        -- 仅在普通 buffer 且文件存在时检测，避免在特殊窗口（如 NvimTree/Telescope/Snacks）报错
        if vim.o.buftype == "" and vim.fn.filereadable(vim.fn.expand("%")) == 1 then
            vim.cmd("checktime")
        end
    end,
})

-- 当文件确实被外部修改并自动完成重载时，弹出一个 Notifications 提示
autocmd("FileChangedShellPost", {
    group = auto_read_group,
    callback = function()
        vim.notify("Current file is changed by other processes, reloaded", vim.log.levels.WARN, {
            title = "File Changed On Disk",
        })
    end,
})
