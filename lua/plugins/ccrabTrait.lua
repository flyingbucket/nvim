return {
    "flyingbucket/ccrab_stub.nvim",
    config = function()
        vim.keymap.set("n", "<leader>gs", ":GenCStub<CR>", { desc = "Generate C stub" })
    end,
}
