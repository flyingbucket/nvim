-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
vim.keymap.set("n", "<leader>ff", function()
    require("telescope.builtin").find_files({
        cwd = Util.root(),
        hidden = true,
        no_ignore = true,
    })
end, { desc = "Find Files (All, no git limit)" })
