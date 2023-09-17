-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.color_scheme = "Tokyo Night"
config.font = wezterm.font("Fira Code")
config.adjust_window_size_when_changing_font_size = false
config.font_size = 14.5
config.scrollback_lines = 2000

-- and finally, return the configuration to wezterm
return config
