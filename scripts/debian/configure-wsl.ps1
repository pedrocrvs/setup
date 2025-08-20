$ErrorActionPreference = "Stop"


$ResourceConfigContent = Get-Content "$PSScriptRoot\..\..\resources\wsl\wsl.conf" -Raw


wsl --distribution "Debian" --exec "bash" "-c" "sudo tee /etc/wsl.conf <<< '$ResourceConfigContent'"


wsl --shutdown

Start-Sleep -Seconds 10
