@echo off

echo Creating links...

mklink /D "%USERPROFILE%\nvim" "%USERPROFILE%\.dotfiles\nvim"
setx XDG_CONFIG_HOME "%USERPROFILE%"
mklink /D "%USERPROFILE%\wezterm" "%USERPROFILE%\.dotfiles\wezterm"
mklink "%USERPROFILE%\.gitconfig" "%USERPROFILE%\.dotfiles\.gitconfig"
mklink "%USERPROFILE%\.config\starship.toml" "%USERPROFILE%\.dotfiles\.config\starship.toml"

echo Links created
pause
