vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

return {
    { "echasnovski/mini.nvim", version = "*", event = "VeryLazy" },
    { "ThePrimeagen/vim-be-good", version = "*", event = "VeryLazy" },

    -- colourscheme setup
    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = { style = "night" },
    },
    {
        "catppuccin/nvim",
        lazy = true,
        enabled = false,
        name = "catppuccin",
        opts = {
            flavour = "macchiato",
            integrations = {
                alpha = true,
                cmp = true,
                gitsigns = true,
                illuminate = true,
                indent_blankline = { enabled = true },
                lsp_trouble = true,
                mason = true,
                mini = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
                navic = { enabled = true, custom_bg = "lualine" },
                neotest = true,
                noice = true,
                notify = true,
                neotree = true,
                semantic_tokens = true,
                telescope = true,
                treesitter = true,
                which_key = true,
            },
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    },

    -- add fuzzy finding to telescope
    {
        "telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
    },

    -- quick jumping between common files
    {
        "ThePrimeagen/harpoon",
        event = "VeryLazy",
    },

    -- project specific config for LSP
    {
        "folke/neoconf.nvim",
        event = "VeryLazy",
    },

    -- intergration between tmux panes and vim buffers
    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
    },

    -- disable useless plugins
    { "folke/trouble.nvim", enabled = false },
    {
        "echasnovski/mini.indentscope",
        enabled = false,
    },
    {
        "ggandor/leap.nvim",
        enabled = false,
    },
    {
        "ggandor/flit.nvim",
        enabled = false,
    },
    {
        "akinsho/bufferline.nvim",
        enabled = false,
    },
    {
        "goolord/alpha-nvim",
        enabled = false,
    },
    {
        "echasnovski/mini.pairs",
        enabled = false,
    },
    {
        "folke/which-key.nvim",
        enabled = false,
    },
    {

        "lukas-reineke/indent-blankline.nvim",
        enabled = false,
    },

    { import = "lazyvim.plugins.extras.lang.clangd" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "plugins" },
}
