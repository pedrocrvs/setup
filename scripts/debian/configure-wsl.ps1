$ErrorActionPreference = "Stop"


$ResourceConfigContent = Get-Content -Raw (Join-Path -Path $PSScriptRoot -ChildPath "..\..\resources\wsl\wsl.conf")


wsl --distribution "Debian" --exec "bash" "-c" "sudo tee /etc/wsl.conf <<< '$ResourceConfigContent'"


wsl --shutdown

Start-Sleep -Seconds 10
