local lspconfig = require("lspconfig")
print("Using clangd from /usr/bin/clangd")
lspconfig.clangd.setup({
    cmd = { "/usr/bin/clangd" },
    filetypes = { "c", "cpp", "cuda" },
    init_options = {
        clangdFileStatus = true,
    },
})

-- return {
--   "neovim/nvim-lspconfig",
--   config = function()
--     require("lspconfig").clangd.setup({
--       cmd = { "/usr/bin/clangd" },
--       filetypes = { "c", "cpp", "cuda" },
--       init_options = {
--           clangdFileStatus = true,
--     })
--   end,
-- }
-- return {
--   "neovim/nvim-lspconfig",
--   print("clangd loaded")
--   opts = {
--     servers = {
--       clangd = {
--         cmd = { "clangd" ,"--background-index"},
--         filetypes = { "c", "cpp", "cuda" },
--         init_options = {
--           clangdFileStatus = true,
--         },
--       },
--     },
--   },
-- }
