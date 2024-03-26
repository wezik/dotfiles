Write-Host "__      _____ _______ _  __"
Write-Host "\ \    / / __|_  /_ _| |/ /"
Write-Host " \ \/\/ /| _| / / | || ' < "
Write-Host "  \_/\_/ |___/___|___|_|\_\"

# Check if the current user has administrative privileges
$adminRights = [Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
if (-not $adminRights.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "You need administrative privileges to run this script. Exiting..."
    Pause
    Exit 1
}

Write-Host "Creating links..."

$dotfilesDir = "$home\.dotfiles"

# Set XDG_CONFIG_HOME to home directory used primarly for wezterm config
$env:XDG_CONFIG_HOME = $home

function CreateLink {
    param(
        [string]$Target,
        [string]$Source
    )
    New-Item -ItemType SymbolicLink -Path $Target -Target $Source -Force > $null
    Write-Host "$(Split-Path -Leaf $Source) symlink created."
}

function LinkAndOverride {
    param(
        [string]$Target,
        [string]$Source
    )
    if (Test-Path $Target) {
        $overwrite = Read-Host "$Target already exists. Do you want to overwrite it? (Y/N)"
        if ($overwrite -eq "Y" -or $overwrite -eq "y") {
            Remove-Item $Target -Force -Recurse
            CreateLink $Target $Source
        }
    } else {
        CreateLink $Target $Source
    }
}

# Create symbolic links for directories
LinkAndOverride "$home\nvim" "$dotfilesDir\nvim"
LinkAndOverride "$home\wezterm" "$dotfilesDir\wezterm"

# Create symbolic links for . files
LinkAndOverride "$home\.config\starship.toml" "$dotfilesDir\.config\starship.toml"
LinkAndOverride "$home\.gitconfig" "$dotfilesDir\.config\.gitconfig"

# Overwrite powershell profile
LinkAndOverride $PROFILE.CurrentUserAllHosts "$dotfilesDir\.config\powershell.ps1" 

Write-Host "Links created"

Pause
