vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

return {
    -- colourscheme setup
    -- { "ellisonleao/gruvbox.nvim" },
    { "echasnovski/mini.nvim", version = "*", event = "VeryLazy" },

    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = { style = "night" },
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        enabled = false,
    },
    {
        "rafamadriz/friendly-snippets",
        enabled = false,
    },

    {
        "echasnovski/mini.indentscope",
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

        "lukas-reineke/indent-blankline.nvim",
        enabled = false,
    },

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

    {
        "echasnovski/mini.surround",
        opts = {
            mappings = {
                add = "gsa",
                delete = "gsd",
                find = "gsf",
                find_left = "gsF",
                highlight = "gsh",
                replace = "gsr",
                update_n_lines = "gsn",
            },
        },
    },
    {
        "ThePrimeagen/harpoon",
        event = "VeryLazy",
    },

    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        event = "VeryLazy",
        opts = function()
            return {
                require("nvim-tree").setup({
                    sort_by = "case_sensitive",
                    view = {
                        adaptive_size = true,
                        mappings = {
                            list = {
                                { key = "u", action = "dir_up" },
                            },
                        },
                    },
                    renderer = {
                        group_empty = true,
                    },
                    filters = {
                        dotfiles = true,
                    },
                }),
            }
        end,
    },

    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
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
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                clangd = {},
                pyright = {},
            },
        },
    },

    { import = "lazyvim.plugins.extras.lang.typescript" },
}
