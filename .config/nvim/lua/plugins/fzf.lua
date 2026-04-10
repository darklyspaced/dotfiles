return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{
			"<leader><leader>",
			function()
				local scope
				if vim.loop.fs_stat(vim.loop.cwd() .. "/.git") then
					scope = "git_files"
				else
					scope = "files"
				end
				require("fzf-lua")[scope]()
			end,
			desc = "Opens git_files if in .git, else files in current dir",
		},
		{
			-- [s]earch [g]rep
			"<leader>sg",
			"<CMD>FzfLua live_grep_native<CR>",
			desc = "Search for a string across project",
		},
		{
			"<leader>;",
			"<CMD>FzfLua resume<CR>",
			desc = "Resume the previous search",
		},
		{
			-- [e]rrors
			"<leader>e",
			"<CMD>FzfLua diagnostics_workspace<CR>",
			desc = "Search through all diagnostics in the workspace",
		},
		{
			-- [f]ile [e]rrors
			"<leader>fe",
			"<CMD>FzfLua diagnostics_document<CR>",
			desc = "Search through all the diagnostics in the current file",
		},
		{
			-- [s]earch [s]ymbols
			"<leader>ss",
			"<CMD>FzfLua lsp_document_symbols<CR>",
			desc = "Search through the symbols (functions, variables) in a document",
		},
	},
}
