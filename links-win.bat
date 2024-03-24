@echo off

echo Creating links...

mklink /D "%USERPROFILE%\nvim" "%USERPROFILE%\.dotfiles\nvim"
mklink /D "%USERPROFILE%\nvim1" "%USERPROFILE%\.dotfiles\nvim1"
setx XDG_CONFIG_HOME "%USERPROFILE%"
mklink /D "%USERPROFILE%\wezterm" "%USERPROFILE%\.dotfiles\wezterm"
mklink "%USERPROFILE%\.gitconfig" "%USERPROFILE%\.dotfiles\.gitconfig"

echo Links created
pause
