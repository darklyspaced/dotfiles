return {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    ft = { "rust" },
    keys = {
        {
            "<leader>i",
            function()
                vim.cmd.RustLsp({ "renderDiagnostic", "current" })
            end,
            ft = "rust",
            desc = "Render diagnostics nicely",
        }
    },
}
