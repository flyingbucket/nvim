return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    keys = {
        -- override <leader>ff only
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files({
                    cwd = require("lazyvim.util").root(),
                    hidden = true,
                    no_ignore = false,
                })
            end,
            desc = "Find Files (All, no git limit)",
        },
    },
}
