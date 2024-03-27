local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback {
  {
    family = 'JetBrainsMono Nerd Font',
    weight = 'Regular',
  }
  -- 'CommitMono Nerd Font',
  -- 'JetBrainsMono Nerd Font',
  -- 'JetbrainsMono Nerd Font',
  -- 'CommitMono',
  -- 'JetBrains Mono',
  -- 'Jetbrains Mono'
}
config.font_size = 12.0
config.line_height = 1
config.cell_width = 1
config.color_scheme = 'Guezwhoz'
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

local is_windows = package.config:sub(1,1) == '\\'
local bg_path
local wezterm_home

if is_windows then
  wezterm_home = os.getenv('XDG_CONFIG_HOME')
  bg_path = wezterm_home .. '\\wezterm\\wezterm-background.png'
  bg_path = bg_path:gsub("\\", "/")
  config.default_prog = { "powershell.exe", "-NoExit", "-NoLogo" }
  -- config.default_prog = { "cygwin" }
else
  wezterm_home = os.getenv('HOME')
  bg_path = wezterm_home .. '/.config/wezterm/wezterm-background.png'
end

local act = wezterm.action

local backgroundEnabled = false
local stored_bg = config.background

local function toggleBackground()
  if backgroundEnabled then
    config.background = stored_bg
    backgroundEnabled = false
  else
    config.background = {
      {
        source = {
          File = bg_path,
        },
        opacity = 0.5
      }
    }
    backgroundEnabled = true
  end
end

config.leader = { key = 'x', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  {
    key = 'X',
    mods = 'CTRL|SHIFT',
    action = act.SendKey { key = 'x', mods = 'CTRL' },
  },
  {
    key = 't',
    mods = 'CTRL|SHIFT|ALT',
    action = act.ShowTabNavigator,
  },
  {
    key = 's',
    mods = 'LEADER|CTRL|SHIFT',
    action = act.SplitVertical,
  },
  {
    key = 'h',
    mods = 'LEADER|CTRL|SHIFT',
    action = act.SplitHorizontal,
  },
  {
    key = 'h',
    mods = 'LEADER|CTRL',
    action = act.ActivatePaneDirection "Left",
  },
  {
    key = 'j',
    mods = 'LEADER|CTRL',
    action = act.ActivatePaneDirection "Down",
  },
  {
    key = 'k',
    mods = 'LEADER|CTRL',
    action = act.ActivatePaneDirection "Up",
  },
  {
    key = 'l',
    mods = 'LEADER|CTRL',
    action = act.ActivatePaneDirection "Right",
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
    key = 'G',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action_callback(function(_, _)
      wezterm.log_info("Toggling background")
      toggleBackground()
    end),
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

return config
