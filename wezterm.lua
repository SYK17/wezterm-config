local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Apply your config choices
config.automatically_reload_config = true

config.max_fps = 240

-- Cursor settings
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.cursor_blink_rate = 550
config.animation_fps = 1

-- **Cursor color settings**
config.colors = {
	cursor_bg = 'F45F00',  -- Cursor background color
	cursor_border = '#8F8F8F',  -- Cursor border color
	cursor_fg = '#FFFFFF',  -- Cursor foreground color
}

-- Function to determine color scheme based on system theme
-- local function get_color_scheme()
--     if wezterm.gui.get_appearance():find("Dark") then
--         return "Ibm3270 (Gogh)"
--     else
--         return "Breath Light (Gogh)"
--     end
-- end

-- Color scheme
-- config.color_scheme = get_color_scheme() -- Enable for auto colorscheme change
-- config.color_scheme = 'Adventure'
-- config.color_scheme = 'Afterglow'
-- config.color_scheme = 'Hybrid'
-- config.color_scheme = 'Hybrid (terminal.sexy)'
config.color_scheme = 'Ibm3270 (Gogh)'
-- config.color_scheme = 'iceberg-light'
-- config.color_scheme = 'iceberg-dark'
-- config.color_scheme = 'Mashup Colors (terminal.sexy)'
-- config.color_scheme = 'Ocean (dark) (terminal.sexy)'
-- config.color_scheme = 'Brewer (dark) (terminal.sexy)'

-- Tab bar settings
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

-- Font settings
config.font = wezterm.font({
	-- Replace 'SF Mono' with the exact name of your patched font
	-- This might be something like 'SF Mono Nerd Font' if you're using a Nerd Fonts version
	family = 'Liga SFMono Nerd Font',
	-- family = 'IBM Plex Mono',
	-- Optionally specify weight
	weight = 'Regular',
	-- Enable font features for ligatures
	harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
})

config.font_size = 14.0

-- Window settings
config.window_decorations = "RESIZE"

-- Window background settings
config.window_background_opacity = 0.3
config.macos_window_background_blur = 30

-- Key bindings
config.keys = {
	{
		key = "Backspace",
		mods = "CMD",
		action = wezterm.action.SendString("\x15"),  -- Remaps CMD + backspace to \x15 (Ctrl+U) to delete line.
	},
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action.SendString("\x1bb"),  -- Move back a word.
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action.SendString("\x1bf"),  -- Move forward a word.
	},
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action.SendString("\x01\x01"),  -- Move to beginning on line. \x01 is sent twice to escape it. This prevents clashing with TMUX prefix Ctrl+a.
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action.SendString("\x05"),  -- Move to end of line.
	},

}

-- return the configuration to wezterm
return config
