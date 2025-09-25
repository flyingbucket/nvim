return {
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
        opts = {
            lang = "c", -- 初始语言
            storage = {
                home = "/home/flyingbucket/CODE/leetcode",
                cache = "/home/flyingbucket/.cache/leetcode", -- 可选：缓存目录
            },
            cn = {
                enabled = true, -- 打开国服站点
                -- translator = true, -- 使用国服翻译服务
                translate_problems = true, -- 显示题面中文翻译
            },
        },
    },
}
