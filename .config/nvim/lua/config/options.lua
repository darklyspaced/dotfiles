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

-- no line wrapping
opt.wrap = false
opt.colorcolumn = "120"

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 5

opt.undofile = true

opt.autowriteall = true
opt.foldenable = false

vim.opt.winborder = "single"

-- for molten
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")

vim.diagnostic.config({
    virtual_text = true,
    float = { border = "rounded" },
})

vim.opt.swapfile = false

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.textwidth = 100
        vim.opt_local.colorcolumn = "100"
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.breakindent = true
    end,
})

-- local home = os.getenv("HOME")
-- local swapDirectory = home .. "/.local/share/nvim/swap//"
-- vim.o.directory = swapDirectory

vim.g.rustaceanvim = {
    server = {
        default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
                highlightingOn = true,
                -- raLspServerPath = "/Users/rohan/.cargo/bin/rust-analyzer",
                diagnostic = {
                    refreshSupport = true,
                },
            },
        },
    },
}
