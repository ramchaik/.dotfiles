-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

local function get_random_wallpaper()
	local WALLPAPERS_BASE_PATH = "/Users/vaibhavsingh/Documents/wallpapers/"
	local wallpapers = {}
	local p = io.popen("ls '" .. WALLPAPERS_BASE_PATH .. "'")
	if p then
		for file in p:lines() do
			table.insert(wallpapers, file)
		end
		p:close()
		local maxIdx = #wallpapers
		local rndIdx = math.random(1, maxIdx)
		return WALLPAPERS_BASE_PATH .. wallpapers[rndIdx]
	else
		print("Failed to open the directory: " .. WALLPAPERS_BASE_PATH)
	end
end

config.background = {
	{
		source = {
			File = get_random_wallpaper(),
		},
		hsb = { hue = 1.0, saturation = 1.0, brightness = 0.03 },
	},
}

config.color_scheme = "Catppuccin Mocha"

config.window_background_opacity = 0.90
config.macos_window_background_blur = 10

return config
