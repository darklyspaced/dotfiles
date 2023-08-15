return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		lazy = true,
		config = function()
			require("lsp-zero.settings").preset("recommended")
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
		},

		config = function()
			require("lsp-zero.cmp").extend()

			local cmp = require("cmp")
			local cmp_action = require("lsp-zero").cmp_action()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

			cmp.setup({
				mapping = {
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<Tab>"] = cmp_action.luasnip_supertab(),
					["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
				},
				preselect = "item",
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
				},
				formatting = {
					fields = { cmp.ItemField.Abbr, cmp.ItemField.Kind },
					-- its always [LSP] smh
					format = function(_, item)
						item.menu = nil
						return item
					end,
				},
				sources = cmp.config.sources({
					-- don't suggest text and snippets cause its just clutter
					{
						name = "nvim_lsp",
						entry_filter = function(entry, _)
							return (require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind())
								and (require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind())
						end,
					},
				}),
			})
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "williamboman/mason.nvim" },
			{ "simrat39/rust-tools.nvim" },
			{ "folke/neoconf.nvim" },
		},
		config = function()
			local lsp = require("lsp-zero")
			lsp.on_attach(function(_, bufnr)
				-- see :help lsp-zero-keybindings for keybindings
				lsp.default_keymaps({ buffer = bufnr })
			end)

			lsp.skip_server_setup({ "rust_analyzer", "hls", "jdtls" })

			require("neoconf").setup({})
			require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

			lsp.setup()

			--setup null-ls
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
								-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
				sources = {
					-- Replace these with the tools you have installed
					-- make sure the source name is supported by null-ls
					-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
					null_ls.builtins.formatting.rustfmt,
					null_ls.builtins.formatting.stylua,
				},
			})

			local haskell_tools = require("haskell-tools")
			local hls_lsp = require("lsp-zero").build_options("hls", {})

			local hls_config = {
				hls = {
					capabilities = hls_lsp.capabilities,
					on_attach = function(client, bufnr)
						local opts = { buffer = bufnr }

						-- haskell-language-server relies heavily on codeLenses,
						-- so auto-refresh (see advanced configuration) is enabled by default
						vim.keymap.set("n", "<leader>ca", vim.lsp.codelens.run, opts)
						vim.keymap.set("n", "<leader>hs", haskell_tools.hoogle.hoogle_signature, opts)
						vim.keymap.set("n", "<leader>ea", haskell_tools.lsp.buf_eval_all, opts)
					end,
				},
			}

			-- Autocmd that will actually be in charging of starting hls
			local hls_augroup = vim.api.nvim_create_augroup("haskell-lsp", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				group = hls_augroup,
				pattern = { "haskell" },
				callback = function()
					haskell_tools.start_or_attach(hls_config)

					---
					-- Suggested keymaps that do not depend on haskell-language-server:
					---

					-- Toggle a GHCi repl for the current package
					vim.keymap.set("n", "<leader>rr", haskell_tools.repl.toggle, opts)

					-- Toggle a GHCi repl for the current buffer
					vim.keymap.set("n", "<leader>rf", function()
						haskell_tools.repl.toggle(vim.api.nvim_buf_get_name(0))
					end, def_opts)

					vim.keymap.set("n", "<leader>rq", haskell_tools.repl.quit, opts)
				end,
			})

			-- setup rust-tools
			local rt = require("rust-tools")
			-- setup options don't work for some unknown reason :(
			rt.setup({
				server = {
					on_attach = function(_, bufnr)
						-- Hover actions
						vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
						-- Code action groups
						vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
					end,
				},
			})
		end,
	},
	{
		"MrcJkb/haskell-tools.nvim",
		lazy = true,
	},
	{
		"simrat39/rust-tools.nvim",
		lazy = true,
	},
	{
		"folke/neoconf.nvim",
		lazy = true,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		lazy = true,
	},
}
