local u = require('utils')

-- Map leader to space
vim.g.mapleader = ' '
local fn = vim.fn
local execute = vim.api.nvim_command

-- disable highlight
u.map("n", "<Leader><CR>", ":noh<CR>")

-- exit insert mode
u.map("i", "jk", "<Esc>")

-- easy neovim window navigation
u.map('n', '<C-j>', '<C-w>j')
u.map('n', '<C-h>', '<C-w>h')
u.map('n', '<C-k>', '<C-w>k')
u.map('n', '<C-l>', '<C-w>l')

-- neovim windows resize
u.map('n', '<C-Up>', ':resize +3<CR>', {silent = true})
u.map('n', '<C-Down>', ':resize -3<CR>', {silent = true})
u.map('n', '<C-Right>', ':vertical resize +3<CR>', {silent = true})
u.map('n', '<C-Left>', ':vertical resize -3<CR>', {silent = true})

-- neovim buff navigation
u.map('n', '<TAB>', ':bnext<CR>') -- {noremap = true, silent = true}
u.map('n', '<S-TAB>', ':bprevious<CR>') -- {noremap = true, silent = true}
u.map('n', '<Leader>q', ':bdelete<CR>') -- {noremap = true, silent = true}

-- neovim exit terminal mode
u.map('t', '<Esc>', '<C-\\><C-n>')
