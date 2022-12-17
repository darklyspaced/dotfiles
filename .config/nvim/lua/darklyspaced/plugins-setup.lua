-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim") --packer.nvim
	use("sainnhe/gruvbox-material") --colourscheme

	use("numToStr/Comment.nvim") --help commenting gc + motion / c to do curr line

	use("nvim-lua/plenary.nvim") -- useful lua functions

	use("nvim-lualine/lualine.nvim") -- status line

	use("ryanoasis/vim-devicons") -- nice icons

	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) --fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- enhances telescope

	--autocompletion
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")

	--managing and installing lsp servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	--configuring lsp servers
	use("neovim/nvim-lspconfig")

	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	use("MunifTanjim/prettier.nvim")

	--treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	--typescript/javascript language server
	use("jose-elias-alvarez/typescript.nvim")

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	use("ggandor/leap.nvim") -- better vertical movement!

	use("mfussenegger/nvim-dap") -- debugging
	use("rcarriga/nvim-dap-ui") -- adds the

	if packer_bootstrap then
		require("packer").sync()
	end
end)
