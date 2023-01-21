vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

return {
  -- colourscheme setup
  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
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
    "Pocco81/auto-save.nvim",
    event = "InsertEnter",
    opts = function()
      return {
        require("auto-save").setup({
          debounce_delay = 1000,
          execution_message = {
            message = function() -- message to print on save
              return ("Saved at:" .. vim.fn.strftime("%H:%M:%S"))
            end,
            dim = 0.18, -- dim the color of `message`
            cleaning_interval = 1, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
          },
        }),
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        clangd = {},
      },
    },
  },

  { import = "lazyvim.plugins.extras.lang.typescript" },
}
