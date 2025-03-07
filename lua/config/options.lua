-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

--line numbers
opt.number = true
opt.relativenumber = true

--tab
opt.tabstop = 8

--clipboard
opt.clipboard:append("unnamedplus")
