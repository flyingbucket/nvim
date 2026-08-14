return {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt", "java" },
    dependencies = {
        { "j-hui/fidget.nvim", opts = {} },
        { "mfussenegger/nvim-dap" },
    },
    opts = function()
        local metals = require("metals")
        local cfg = metals.bare_config()

        cfg.settings = {
            showImplicitArguments = false,
            showImplicitConversionsAndClasses = false,
            showInferredType = true,
            excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
        }
        cfg.init_options = { statusBarProvider = "off" }

        -- 获取 capabilities（兼容 blink.cmp 或 nvim-cmp）
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local ok_lv, lv = pcall(require, "lazyvim.util")
        if ok_lv and lv.lsp and lv.lsp.get_capabilities then
            capabilities = lv.lsp.get_capabilities(capabilities)
        end
        cfg.capabilities = capabilities

        -- 修正 on_attach 签名，并正确挂载 DAP
        cfg.on_attach = function(client, bufnr)
            metals.setup_dap()

            -- 针对 Scala 的特化快捷键推荐（通过 Metals 命令启动调试/运行）
            local map = vim.keymap.set
            map("n", "<leader>cM", function()
                require("telescope").extensions.metals.commands()
            end, { buffer = bufnr, desc = "Metals Commands" })
            map("n", "<leader>dr", function()
                require("metals").run_specific_target()
            end, { buffer = bufnr, desc = "Metals Run Target" })
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
