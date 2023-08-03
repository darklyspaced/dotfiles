return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
	{
		"echasnovski/mini.comment",
		version = false,
		opts = {
			mappings = {
				-- Toggle comment (like `gcip` - comment inner paragraph) for both
				-- Normal and Visual modes
				comment = "gc",

				-- Toggle comment on current line
				comment_line = "gcc",

				-- Define 'comment' textobject (like `dgc` - delete whole comment block)
				textobject = "gc",
			},
		},
		config = function(opts)
			require("mini.comment").setup()
		end,
	},
}
