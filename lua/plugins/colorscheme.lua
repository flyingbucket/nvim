return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "td_metal_archspire",
        },
    },

    {
        "ellisonleao/gruvbox.nvim",
        lazy = true,
        priority = 100,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true,
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true,
                contrast = "",
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = true,
            })
        end,
    },

    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        lazy = true,
        priority = 1000,
        config = function()
            require("github-theme").setup({
                -- ...
            })
        end,
    },
}
