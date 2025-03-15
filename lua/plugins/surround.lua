return {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            keymaps = {
                insert = "<C-g>i",
                normal = "<leader>yr",
                normal_cur = "<leader>yrr",
                normal_line = "<leader>yR",
                normal_cur_line = "<leader>yRR",
                visual = "R",
                visual_line = "gR",
                delete = "<leader>dr",
                change = "<leader>hr",
            },
            -- Configuration here, or leave empty to use defaults
        })
    end,
}
