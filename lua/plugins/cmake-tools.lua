return {
    "Civitasv/cmake-tools.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
        require("cmake-tools").setup({
            cmake_command = "cmake",
            cmake_regenerate_on_save = true, -- 保存时自动重新配置
            cmake_build_directory = "build", -- 指定构建目录
            -- 关键：确保生成 compile_commands.json 给 clangd 使用
            cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
        })
    end,
}
