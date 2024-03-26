@echo off

echo Running PowerShell script to create symbolic links...

powershell.exe -ExecutionPolicy Bypass -File "%USERPROFILE%\.dotfiles\win-symlinks.ps1"
