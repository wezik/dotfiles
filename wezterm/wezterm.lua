local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrains Mono'
config.color_scheme = 'Batman'

local localappdata = os.getenv('XDG_CONFIG_HOME')
local bg_path = localappdata .. '\\wezterm\\wezterm-background.png'
bg_path = bg_path:gsub("\\", "/")

config.background = {
        {
                source = {
                        File = bg_path,
                },
                hsb = { brightness = 0.5 }
        }
}

return config
