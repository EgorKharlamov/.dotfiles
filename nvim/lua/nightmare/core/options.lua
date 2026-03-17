local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true         -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2       -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2    -- 2 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- swap files
opt.swapfile = false

-- scrolling
opt.smoothscroll = true

-- line wrapping
opt.wrap = true -- enable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"  -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- opt.iskeyword:append("-") -- consider string-string as whole word
--
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"


-- NEOVIDE CONFIGURATIONS
if vim.g.neovide then
  vim.o.guifont = "TX-02:h10"
  vim.g.neovide_fullscreen = false
  vim.g.neovide_floating_blur_amount_x = 4.0
  vim.g.floaterm_winblend = 15
  vim.g.neovide_floating_blur_amount_y = 4.0
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_opacity = 0.95
  -- vim.g.neovide_padding_top = 10
  -- vim.g.neovide_padding_bottom = 10
  -- vim.g.neovide_padding_right = 10
  -- vim.g.neovide_padding_left = 10
  vim.g.neovide_cursor_animation_length = 0.13
  vim.g.neovide_cursor_trail_length = 0.8
  vim.g.neovide_cursor_vfx_mode = "railgun" -- Railgun particles behind cursor
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  vim.g.neovide_cursor_vfx_particle_density = 7.0
  vim.g.neovide_cursor_vfx_particle_speed = 10.0
  vim.g.neovide_cursor_vfx_particle_phase = 1.5
  vim.g.neovide_cursor_vfx_particle_curl = 1.0
  vim.g.neovide_cursor_unfocused_outline_width = 0.125
end
