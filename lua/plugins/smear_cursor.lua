return {
    "sphamba/smear-cursor.nvim",
    -- exclude neovide
    cond = function()
        return not vim.g.neovide
    end,
    opts = {},
}
