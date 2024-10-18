local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 10.0
config.line_height = 0.8
config.color_scheme = 'OneDark'

config.enable_tab_bar = false

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.window_background_opacity = 0.9

return config
