local opt = vim.opt

opt.guicursor = ""

-- spaces > tabs
opt.tabstop = 4 -- reveal hiding tabs
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- nice line numbers
opt.rnu = true
opt.nu = true

-- no line wrapping pls
opt.wrap = false

opt.hlsearch = false
opt.incsearch = true

-- opt.scrolloff = 12

opt.undofile = true

opt.autowriteall = true
opt.foldenable = false

vim.diagnostic.config({
	float = { border = "rounded" },
})

local home = os.getenv("HOME")
local swapDirectory = home .. "/.local/share/nvim/swap//"
vim.o.directory = swapDirectory
