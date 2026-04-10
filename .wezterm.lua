---@type Wezterm
local wezterm = require("wezterm")

---@type Config
local config = wezterm.config_builder()

config.color_scheme = "GruvboxDarkHard"
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.adjust_window_size_when_changing_font_size = false
config.max_fps = 120
config.font_size = 21
config.animation_fps = 120
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'RESIZE'

-- config.window_background_opacity = 0.93
-- config.macos_window_background_blur = 30

config.keys = {
    -- Sends ESC + b and ESC + f sequence
    {
        key = 'h',
        mods = 'OPT',
        action = wezterm.action.SendString '\x1bb',
        -- jump a word left
    },
    {
        key = 'l',
        mods = 'OPT',
        action = wezterm.action.SendString '\x1bf',
        -- jump a word right
    },
}


return config
