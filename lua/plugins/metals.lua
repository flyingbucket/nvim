return {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt", "java" },
    dependencies = {
        { "j-hui/fidget.nvim", opts = {} },
        { "mfussenegger/nvim-dap" },
        -- ⚠ 不要加 "hrsh7th/cmp-nvim-lsp"
    },
    opts = function()
        local metals = require("metals")
        local cfg = metals.bare_config()

        cfg.settings = {
            showImplicitArguments = true,
            excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
        }
        cfg.init_options = { statusBarProvider = "off" }

        -- ✅ 用 LazyVim 的能力获取函数，自动兼容 blink 或 cmp
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local ok_lv, lv = pcall(require, "lazyvim.util")
        if ok_lv and lv.lsp and lv.lsp.get_capabilities then
            capabilities = lv.lsp.get_capabilities(capabilities)
        end
        cfg.capabilities = capabilities

        cfg.on_attach = function()
            require("metals").setup_dap()
            -- 你的键位映射...
        end
        return cfg
    end,
    config = function(_, cfg)
        local metals = require("metals")
        local group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "scala", "sbt", "java" },
            group = group,
            callback = function()
                metals.initialize_or_attach(cfg)
            end,
        })
    end,
}
