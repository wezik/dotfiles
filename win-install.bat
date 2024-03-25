@echo off

choco install wezterm -y
choco install zig -y
choco install neovim -y
choco install nvm -y
choco install ripgrep -y
choco install python3 -y
choco install starship -y

git clone -b "refactor/0.2" "https://github.com/wezik/nvim-config" "%USERPROFLE%\.dotfiles\nvim"

pause

refreshenv
