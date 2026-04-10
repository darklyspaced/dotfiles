vim.g.mapleader = " "
vim.keymap.set("n", "<leader>di", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)

local modes = { "n", "v", "x", "s", "o", "t" }
for _, mode in ipairs(modes) do
    vim.api.nvim_set_keymap(mode, "H", "^", { noremap = true, silent = true })
    vim.api.nvim_set_keymap(mode, "L", "$", { noremap = true, silent = true })
end

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

vim.keymap.set("n", "q:", "<nop>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>") -- allows escape to be used in terminal

vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "cr", vim.lsp.buf.rename)

vim.keymap.set("n", "<leader>vt",
    function()
        local cfg = vim.diagnostic.config() or {}
        vim.diagnostic.config({ virtual_text = not cfg.virtual_text })
    end)
vim.keymap.set("n", "<leader>vl",
    function()
        local cfg = vim.diagnostic.config() or {}
        vim.diagnostic.config({ virtual_lines = not cfg.virtual_lines })
    end)

vim.keymap.set("i", "<M-BS>", "<C-w>") -- allows option backspace to remove last word in insert mode

vim.keymap.set("n", "<leader>o", "moo<Esc>`o")
vim.keymap.set("n", "<leader>O", "moO<Esc>`o")

vim.keymap.set("n", "<leader>ft", "<CMD>TodoFzfLua<CR>")

if vim.bo.filetype ~= "rust" then
    vim.keymap.set("n", "<leader>i", "<CMD>lua vim.diagnostic.open_float()<CR>")
    vim.keymap.set("n", "<leader>q", "<CMD>lua vim.lsp.buf.code_action()<CR>")
end

vim.cmd([[command W w]])
