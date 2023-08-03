vim.g.mapleader = ' '
vim.keymap.set('n', "<leader>di", vim.cmd.Ex)
vim.keymap.set('n', "<leader>w", vim.cmd.w)

local modes = { 'n', 'i', 'v', 'x', 's', 'o', 't' }

for _, mode in ipairs(modes) do
    vim.api.nvim_set_keymap(mode, 'H', '^', { noremap = true, silent = true })
    vim.api.nvim_set_keymap(mode, 'L', '$', { noremap = true, silent = true })
end


-- remove `q:` because i press it way too fucking much
function Noop()
end
vim.api.nvim_set_keymap('n', 'q:', ':lua Noop()<CR>', { noremap = true, silent = true })
