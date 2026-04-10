return {
    'nvim-java/nvim-java',
    keys = {
        { "<leader>jr", "<cmd>JavaRunnerRunMain", desc = "Runs the application or selected main class" },
    },
    config = function()
        require('java').setup()
        vim.lsp.enable('jdtls')
    end,
}
