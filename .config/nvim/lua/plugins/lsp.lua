return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
    },
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
            vim.lsp.enable('hls')
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "saghen/blink.cmp",
            "neovim/nvim-lspconfig",
        },
        opts = {
            -- the language servers that need to be installed
            ensure_installed = {
                "lua_ls",
                "jdtls",
                "clangd",
                "tinymist",
            },
            automatic_enable = {
                exclude = {
                    "rust_analyzer",
                    "tsserver",
                },
            },
        },
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        dependencies = {
            { "justinsgithub/wezterm-types", lazy = true },
        },
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "wezterm-types",      mods = { "wezterm" } },
            },
        },
    },
    {
        "saghen/blink.cmp",
        version = "1.*",
        config = function(_, opts)
            require("blink.cmp").setup(opts)

            vim.api.nvim_set_hl(0, "PMenu", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "PmenuSel", {
                fg = "#ffffff",
                bg = "#2a2a2a", -- adjust to taste
            })
        end,
        opts = {
            keymap = { preset = "enter" },
            appearance = {
                nerd_font_variant = "normal",
            },
            completion = {
                list = {
                    selection = {
                        auto_insert = true,
                        preselect = function(ctx)
                            return ctx.mode == "cmdline" and "auto_insert" or "preselect"
                        end,
                    },
                },
                documentation = { auto_show = true },

                menu = {
                    border = 'single',
                    draw = {
                        columns = { { "kind_icon" }, { "label", gap = 1 } },
                        treesitter = { "lsp" },
                    },
                },
            },
            sources = {
                default = { "lazydev", "lsp", "path" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                },
            },
        },
        opts_extend = { "sources.default" },
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                -- python = { "isort", "black" },
                -- javascript = { "prettierd", "prettier", stop_after_first = true },
                rust = { "rustfmt" },
                haskell = { "ormolu" },
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
            format_on_save = { timeout_ms = 500 },
        },
    },
}
