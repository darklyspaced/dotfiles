-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

map("n", "<leader>ma", '<cmd>lua require("harpoon.mark").add_file()<cr>', { desc = "Add file to harpoon" })
map("n", "<leader>mp", '<cmd>lua require("harpoon.ui").nav_prev()<cr>', { desc = "Move to next mark" })
map("n", "<leader>mn", '<cmd>lua require("harpoon.ui").nav_next()<cr>', { desc = "Move to previous mark" })
map("n", "<leader>mf", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', { desc = "Search through all marks" })
-- Add any additional keymaps here
