local u = require('utils')

local cmd = vim.cmd
local indent = 2

cmd 'syntax on'
cmd 'filetype plugin indent on'

u.opt('w', 'relativenumber', true)
u.opt('w', 'number', true)
u.opt('w', 'numberwidth', 1)
-- u.opt('w', 'cursorline', true)

u.opt('b', 'expandtab', true)
u.opt('b', 'shiftwidth', indent)
u.opt('b', 'smartindent', true)
u.opt('b', 'tabstop', indent)

u.opt('o', 'cmdheight', 2)
u.opt('o','updatetime', 200)
u.opt('o', 'smarttab', true)
u.opt('o', 'encoding', 'utf-8')
u.opt('o', 'hidden', true)

u.opt('o', 'ignorecase', true)
