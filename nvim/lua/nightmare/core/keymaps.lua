-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap
local diagnostic = vim.diagnostic

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")
keymap.set("v", "<leader>scc", '"+y')
keymap.set("v", "<leader>scp", '"+p')

-- clear search highlights
keymap.set("n", "<ESC>", ":noh<CR>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v")                     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")                     -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")                     -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>")                 -- close current split window
keymap.set("n", "<S-A-h>", '<cmd>vertical resize +5<cr>')   -- make the window biger vertically
keymap.set("n", "<S-A-l>", '<cmd>vertical resize -5<cr>')   -- make the window smaller vertically
keymap.set("n", "<S-A-k>", '<cmd>horizontal resize +2<cr>') -- make the window bigger horizontally by pressing shift and =
keymap.set("n", "<S-A-j>", '<cmd>horizontal resize -2<cr>')

keymap.set("n", "<leader>cfn", '<cmd>let @+ = expand("%:t")<cr>')
keymap.set("n", "<leader>rcfn", '<cmd>let @+ = expand("%")<cr>')

-- update current buffer
keymap.set('n', "<leader>ub", '<cmd>bufdo e<cr>')

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>no", ":NvimTreeOpen<CR>")
keymap.set("n", "<leader>nf", ":NvimTreeFocus<CR>")
keymap.set("n", "<leader>nc", ":NvimTreeClose<CR>")
keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>ft", "<cmd>Telescope frecency workspace=CWD<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")     -- list open buffers in current neovim instance
keymap.set("n", "<leader>fht", "<cmd>Telescope help_tags<cr>")  -- list available help tags
keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>")
keymap.set("n", "<leader>tt", "<cmd>Telescope themes<cr>")

-- bufferline
keymap.set("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<cr>")

-- fugitive
keymap.set("n", "<leader>gs", ":G<CR>")           -- fugitive
keymap.set("n", "<leader>gh", ":diffget //3<CR>") -- fugitive
keymap.set("n", "<leader>gf", ":diffget //2<CR>") -- fugitive

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>")                   -- mapping to restart lsp if necessary
keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<cr>") -- mapping to restart lsp if necessary

-- lazygit
keymap.set("n", "<leader>gg", "<cmd>LazyGit <cr>")

-- LSP
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>") -- list available help tags
keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')

-- diagnostic
keymap.set("n", "<leader>te", "<cmd>lua vim.diagnostic.open_float()<cr>")
keymap.set('n', '<leader>td', function()
  diagnostic.enable(not diagnostic.is_enabled())
end, { silent = true, noremap = true })

-- outline
keymap.set("n", "<leader>tou", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

-- overseer
keymap.set("n", "<leader>ra", "<cmd>OverseerRun<CR>")
keymap.set("n", "<leader>tov", "<cmd>OverseerToggle<CR>")

-- zen mode
keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR>")

-- snippets
local luasnip = require('luasnip')
keymap.set({ "n" }, "<leader>sn", function() luasnip.jump(1) end, { silent = true })
keymap.set({ "n" }, "<leader>sp", function() luasnip.jump(-1) end, { silent = true })
