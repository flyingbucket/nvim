return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        opts = function(_, opts)
            opts.textobjects = opts.textobjects or {}

            opts.textobjects.select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["ac"] = "@cell.outer",
                    ["ic"] = "@cell.inner",
                },
            }

            opts.textobjects.move = {
                enable = true,
                goto_next_start = {
                    ["]c"] = "@cell.outer",
                },
                goto_previous_start = {
                    ["[c"] = "@cell.outer",
                },
            }
        end,
    },
}
