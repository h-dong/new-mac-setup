-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Create config
local config = wezterm.config_builder()

-- Set the font
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.enable_scroll_bar = true
config.scrollback_lines = 5000

config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

config.window_background_opacity = 0.95
config.macos_window_background_blur = 10

-- Add more configs here

-- Enable alt-based keybindings
config.keys = {
	{
		key = "LeftArrow",
		mods = "ALT",
		action = wezterm.action.SendString("\x1bb"), -- Esc + B
	},
	{
		key = "RightArrow",
		mods = "ALT",
		action = wezterm.action.SendString("\x1bf"), -- Esc + F
	},
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action.SendString("\x01"), -- Ctrl + A
	},
	{
		key = "RightArrow",
		mods = "ALT",
		action = wezterm.action.SendString("\x05"), -- Ctrl + E
	}
}
return config