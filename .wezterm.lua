-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "GruvboxDarkHard"
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.adjust_window_size_when_changing_font_size = false

-- and finally, return the configuration to wezterm
return config
