-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

--line numbers
opt.number = true
opt.relativenumber = true
--tab
opt.tabstop = 4

--clipboard
-- opt.clipboard:append("unnamedplus")
-- 设置 clipboard
opt.clipboard = "unnamedplus,unnamed"
opt.backup = false -- 不保留永久备份文件（xxx~）
opt.writebackup = false -- 写入时也不做临时备份
opt.backupcopy = "yes" -- 直接“就地覆盖”旧文件（不走 rename）
opt.directory = "~/.cache/nvim/swap//" -- 把 swap 放本地
opt.backupdir = "~/.cache/nvim/backup//" -- 把备份放本地（虽然后面 backup=false）
opt.undofile = true
opt.undodir = "~/.cache/nvim/undo//" -- 把持久化 undo 放本地
