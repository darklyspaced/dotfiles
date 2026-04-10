return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSUpdateSync" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "tsx",
                "typescript",
                "vim",
                "yaml",
                "toml",
                "rust",
                "haskell",
                "java",
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = true,
        opts = {
            enable = true,
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
        opts = {
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    include_surrounding_whitespace = true,
                },
            },
        },
    },
}
