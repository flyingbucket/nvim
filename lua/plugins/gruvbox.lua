if true then
    return {}
end

return {
    -- add gruvbox
    {
        "ellisonleao/gruvbox.nvim",
        opts = {
            transparent_mod = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },

    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox",
        },
    },
}
