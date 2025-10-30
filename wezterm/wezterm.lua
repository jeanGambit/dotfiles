local wezterm = require("wezterm")
-- wezterm.on('gui-startup', function()
--    local tab, pane, window = mux.spawn_window({})
--    window:gui_window():maximize()
--  end)
local config = wezterm.config_builder()

-- Keybindings --
config.keys = require("keybindings")

-- Cursor --
config.default_cursor_style = "BlinkingBlock" -- Options: 'BlinkingBlock', 'BlinkingUnderline', 'BlinkingBar'
config.cursor_blink_rate = 400 -- Blink interval in milliseconds

-- Font --
config.font_size = 15
config.font = wezterm.font("HurmitNerdFont")

-- Color --
config.color_scheme = "catppuccin-macchiato"

-- Windows --
config.window_background_opacity = 1.0
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
-- Tabs --
config.hide_tab_bar_if_only_one_tab = true

return config
