local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- text search settings
opt.ignorecase = true
opt.smartcase = true

--appearance
opt.termguicolors = true
opt.background = "dark"

opt.undofile = true
opt.directory = ".cache/"
