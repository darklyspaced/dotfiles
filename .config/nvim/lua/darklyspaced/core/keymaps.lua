vim.g.mapleader = " " --set leader to be space

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- dap
keymap.set("n", "<F5>", "<cmd>DapContinue<CR>")
keymap.set("n", "<F11>", "<cmd>DapStepOver<CR>")
keymap.set("n", "<F10>", "<cmd>DapStepInto<CR>")
keymap.set("n", "<F12>", "<cmd>DapStepOut<CR>")
keymap.set("n", "<leader>b", "<cmd>DapToggleBreakpoint<CR>")
keymap.set("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
