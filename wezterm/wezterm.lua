local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrains Mono'
config.color_scheme = 'Batman'

local is_windows = package.config:sub(1,1) == '\\'
local bg_path

if is_windows then
        local wezterm_home = os.getenv('XDG_CONFIG_HOME')
        bg_path = wezterm_home .. '\\wezterm\\wezterm-background.png'
        bg_path = bg_path:gsub("\\", "/")
else
        local wezterm_home = os.getenv('HOME')
        bg_path = wezterm_home .. '/.config/wezterm/wezterm-background.png'
end


config.background = {
        {
                source = {
                        File = bg_path,
                },
                hsb = { brightness = 0.5 }
        }
}

return config
