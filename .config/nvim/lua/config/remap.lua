vim.g.mapleader = " "
vim.keymap.set("n", "<leader>di", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)

local modes = { "n", "v", "x", "s", "o", "t" }
for _, mode in ipairs(modes) do
    vim.api.nvim_set_keymap(mode, "H", "^", { noremap = true, silent = true })
    vim.api.nvim_set_keymap(mode, "L", "$", { noremap = true, silent = true })
end

vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

vim.keymap.set("n", "q:", "<nop>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

vim.keymap.set("n", "<leader>i", vim.diagnostic.open_float) -- i for inspect
vim.keymap.set("n", "cr", vim.lsp.buf.rename)

vim.keymap.set("i", "<M-h>", "<C-o>db")

vim.cmd([[command W w]])
vim.cmd([[ca q q!]])
