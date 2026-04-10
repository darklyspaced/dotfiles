return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    {
        -- allows vim movements in terminal
        "chomosuke/term-edit.nvim",
        lazy = false, -- or ft = 'toggleterm' if you use toggleterm.nvim
        version = "1.*",
    },
    {
        -- allows editing your filetree like a buffer
        "stevearc/oil.nvim",
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "echasnovski/mini.nvim",
        version = "*",
        config = function()
            require("mini.surround").setup()
            local spec_treesitter = require("mini.ai").gen_spec.treesitter
            require("mini.ai").setup({
                custom_textobjects = {
                    f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
                    c = spec_treesitter({ a = "@class.outer", i = "@class.inner" }),
                    o = spec_treesitter({
                        a = { "@conditional.outer", "@loop.outer" },
                        i = { "@conditional.inner", "@loop.inner" },
                    }),
                },
            })
        end,
    },
    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {},
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", "<CMD>UndotreeToggle<CR>", desc = "Toggle [U]ndotree" },
        },
    },
    -- {
    --     "folke/flash.nvim",
    --     event = "VeryLazy",
    --     ---@type Flash.Config
    --     opts = {},
    --     keys = {
    --         { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    --         { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    --         { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    --         { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    --         { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    --     },
    -- },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
}
