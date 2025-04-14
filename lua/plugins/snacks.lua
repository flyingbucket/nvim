return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        notifier = { enabled = true },
        image = { enabled = true },

        ---@class snacks.animate.Config
        ---@field easing? snacks.animate.easing|snacks.animate.easing.Fn
        animate = {
            ---@type snacks.animate.Duration|number
            duration = { step = 16, total = 200 }, -- ms per step
            easing = "liner",
            fps = 120, -- frames per second. Global setting for all animations
        },
        picker = {
            sources = {
                explorer = {
                    -- show hidden files like .env
                    hidden = true,
                    -- show files ignored by git like node_modules
                    ignored = true,
                },
            },
        },
    },
}
