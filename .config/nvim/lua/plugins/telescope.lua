return {
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.2",
        version = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            'nvim-tree/nvim-web-devicons',
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                config = function()
                    require("telescope").load_extension("fzf")
                end,
            }
        },
        keys = {
            -- if in a git dir, search the git files; otherwise just cwd
            { "<leader><space>", function()
                local scope
                if vim.loop.fs_stat(vim.loop.cwd() .. "/.git") then
                    scope = "git_files"
                else
                    scope = "find_files"
                end
                require("telescope.builtin")[scope]()
            end, desc = "Find Files" },
            {"<leader>sg", ":Telescope live_grep<CR>"}
        },
        opts = {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                mappings = {
                    i = {
                        ["<C-Down>"] = function(...)
                            return require("telescope.actions").cycle_history_next(...)
                        end,
                        ["<C-Up>"] = function(...)
                            return require("telescope.actions").cycle_history_prev(...)
                        end,
                        ["<C-f>"] = function(...)
                            return require("telescope.actions").preview_scrolling_down(...)
                        end,
                        ["<C-b>"] = function(...)
                            return require("telescope.actions").preview_scrolling_up(...)
                        end,
                    },
                    n = {
                        ["q"] = function(...)
                            return require("telescope.actions").close(...)
                        end,
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                }
            }
        },
    },
}
