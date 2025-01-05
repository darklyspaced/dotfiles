return {
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            contrast = "hard",
            palette_overrides = {
                dark0_hard = "#181818",
                dark1 = "#181818", -- sign column
            },
        },
        config = function(_, opts)
            require("gruvbox").setup(opts)
            vim.cmd([[colorscheme gruvbox]])
        end,
    },
}
