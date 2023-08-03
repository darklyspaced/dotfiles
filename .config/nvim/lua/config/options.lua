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

-- just not needed
opt.swapfile = false
opt.backup = false

-- no line wrapping pls
opt.wrap = false

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 12

-- faster is just better. usually.
opt.updatetime = 50

opt.undofile = true
