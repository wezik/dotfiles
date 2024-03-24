local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrains Mono'
config.color_scheme = 'Batman'
config.use_fancy_tab_bar = false

local is_windows = package.config:sub(1,1) == '\\'
local bg_path

local act = wezterm.action

config.keys = {
  {
    key = 'R',
    mods = 'CTRL|SHIFT',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, _, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  -- other keys
}

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
