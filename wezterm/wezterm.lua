local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrains Mono'
config.color_scheme = 'Hacktober'
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

local is_windows = package.config:sub(1,1) == '\\'
local bg_path
local wezterm_home

if is_windows then
  wezterm_home = os.getenv('XDG_CONFIG_HOME')
  bg_path = wezterm_home .. '\\wezterm\\wezterm-background.png'
  bg_path = bg_path:gsub("\\", "/")
else
  wezterm_home = os.getenv('HOME')
  bg_path = wezterm_home .. '/.config/wezterm/wezterm-background.png'
end

local act = wezterm.action

config.keys = {
  {
    key = 't',
    mods = 'CTRL|SHIFT|ALT',
    action = act.ShowTabNavigator,
  },
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
  {
    key = ',',
    mods = 'CTRL',
    action = act.SpawnCommandInNewTab {
      cwd = wezterm_home,
      set_environment_variables = {
        TERM = 'screen-256color',
      },
      args = {
        'nvim',
        '/wezterm/wezterm.lua',
      },
    },
  },
}

config.background = {
  {
    source = {
      File = bg_path,
    },
    hsb = { brightness = 0.5 }
  }
}

return config
