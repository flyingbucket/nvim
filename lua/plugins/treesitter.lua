-- return {
--     {
--         "nvim-treesitter/nvim-treesitter",
--         dependencies = {
--             "nvim-treesitter/nvim-treesitter-textobjects",
--         },
--         opts = function(_, opts)
--             opts.textobjects = opts.textobjects or {}
--
--             opts.textobjects.select = {
--                 enable = true,
--                 lookahead = true,
--                 keymaps = {
--                     ["ac"] = "@cell.outer",
--                     ["ic"] = "@cell.inner",
--                 },
--             }
--
--             opts.textobjects.move = {
--                 enable = true,
--                 goto_next_start = {
--                     ["]c"] = "@cell.outer",
--                 },
--                 goto_previous_start = {
--                     ["[c"] = "@cell.outer",
--                 },
--             }
--         end,
--     },
-- }
--
-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        build = ":TSUpdate",
        opts = function(_, opts)
            -- 1) 追加需要安装的 parser（不覆盖原有）
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, {
                "python",
                "scala",
                "c",
                "rust",
                "cuda", -- nvim-treesitter 支持的 CUDA 解析器
                -- 常用基础语法（建议一起装，提升体验）
                "bash",
                "lua",
                "json",
                "toml",
                "yaml",
                "markdown",
                "markdown_inline",
                "regex",
                "query",
            })

            -- 2) 高亮 / 缩进
            opts.highlight = vim.tbl_deep_extend("force", opts.highlight or {}, {
                enable = true,
            })
            opts.indent = vim.tbl_deep_extend("force", opts.indent or {}, {
                enable = true,
            })

            -- 3) 递进选择（增量选择）
            opts.incremental_selection = vim.tbl_deep_extend("force", opts.incremental_selection or {}, {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    scope_incremental = "<S-CR>",
                    node_decremental = "<BS>",
                },
            })

            -- 4) textobjects：选择/移动/参数交换（与默认配置合并）
            opts.textobjects = opts.textobjects or {}

            opts.textobjects.select = vim.tbl_deep_extend("force", opts.textobjects.select or {}, {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["ap"] = "@parameter.outer",
                    ["ip"] = "@parameter.inner",
                },
            })

            opts.textobjects.move = vim.tbl_deep_extend("force", opts.textobjects.move or {}, {
                enable = true,
                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]c"] = "@class.outer",
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@class.outer",
                },
            })

            opts.textobjects.swap = vim.tbl_deep_extend("force", opts.textobjects.swap or {}, {
                enable = true,
                swap_next = { ["<leader>a"] = "@parameter.inner" },
                swap_previous = { ["<leader>A"] = "@parameter.inner" },
            })
        end,
    },
}
