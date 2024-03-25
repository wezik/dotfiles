@echo off

choco install wezterm -y
choco install zig -y
choco install neovim -y
choco install nvm -y
choco install ripgrep -y
choco install python3 -y
choco install starship -y

pause

refreshenv
