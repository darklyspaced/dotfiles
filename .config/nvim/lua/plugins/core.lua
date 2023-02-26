vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

return {
  -- colourscheme setup
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
    "echasnovski/mini.indentscope",
    enabled = false,
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
