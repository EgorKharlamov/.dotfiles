local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 10.0
config.line_height = 0.8
config.color_scheme = 'One Dark (Gogh)'

config.enable_tab_bar = false

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.initial_cols = 75
config.initial_rows = 30

config.window_background_opacity = 0.97
-- config.kde_window_background_blur = true

config.warn_about_missing_glyphs = false

return config
