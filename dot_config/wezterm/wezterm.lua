-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.enable_tab_bar = false

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Macchiato"
	else
		return "Catppuccin Latte"
	end
end

-- and finally, return the configuration to wezterm
return {
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	font = wezterm.font_with_fallback({
		{ family = "JetBrainsMono NFM", weight = "Medium" },
		"Noto Emoji",
		"SF Pro",
	}),

	adjust_window_size_when_changing_font_size = false,
	line_height = 1.3,
	font_size = 15,

	show_new_tab_button_in_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	cursor_thickness = "50%",
	underline_thickness = "250%",

	cursor_blink_rate = 0,
	default_cursor_style = "SteadyBar",

	window_decorations = "RESIZE",
	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
	window_background_opacity = 1,
	macos_window_background_blur = 20,

	debug_key_events = false,
	use_ime = true,

	keys = {
		{ key = "р", mods = "CTRL", action = wezterm.action.SendString("\x08") },
		{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
		{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
		{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
		{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	},

	-- https://github.com/wez/wezterm/issues/119#issuecomment-1206593847
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = wezterm.action.CompleteSelection("PrimarySelection"),
		},

		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},

		{
			event = { Down = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.Nop,
		},
	},
}
