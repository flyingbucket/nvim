return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            -- R
            r = { "styler" },
            rmd = { "styler" },
            quarto = { "styler" },
        },
        formatters = {
            styler = {
                command = "/opt/R/current/bin/Rscript",
                -- 核心：直接传入临时文件路径，让 Rscript 在原地修改该文件
                args = {
                    "-e",
                    "styler::style_file(commandArgs(trailingOnly=TRUE))",
                    "$FILENAME",
                },
                stdin = false, -- 非常重要：告诉 conform 不要走管道，直接传文件名
            },
        },
    },
}
