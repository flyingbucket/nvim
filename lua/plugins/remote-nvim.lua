return {
    {
        "amitds1997/remote-nvim.nvim",
        version = "*", -- 跟随 release
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim",
        },
        cmd = {
            "RemoteStart",
            "RemoteInfo",
            "RemoteCleanup",
            "RemoteConfig",
            "RemoteLog",
        },
        opts = {
            remote = {
                neovim = {
                    path = "nvim", -- 或者写绝对路径，比如 "/opt/conda/bin/nvim"
                    download = false, -- 禁止下载
                },
            },
        },
        config = true, -- 等价于 require("remote-nvim").setup()
    },
}
