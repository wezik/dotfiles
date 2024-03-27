Write-Host "===New powershell session==="
# set starship shell

$q = @{
        docker = "g:\projects\dockers"
        db = "g:\projects\dockers\db"
        pjs = "g:\projects"
        dotfiles = "$home\.dotfiles"
}

Invoke-Expression (&starship init powershell)
