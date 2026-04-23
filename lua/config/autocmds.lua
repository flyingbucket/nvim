-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 监听 UI 进入事件
vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
        if vim.g.neovide then
            vim.o.guifont = "JetBrainsMono Nerd Font:h12"
            vim.notify("Neovide Detected, Font Applied!")
        end
    end,
})
