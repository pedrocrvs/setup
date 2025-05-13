$ErrorActionPreference = "Stop"


$ResourceWslconf = Get-Content "$PSScriptRoot\..\..\resources\wsl\wsl.conf" -Raw


$DebianUser = "pedro"

$DebianBash = "wsl --distribution Debian --user $DebianUser --exec /usr/bin/bash -c"


Invoke-Expression -Command "$DebianBash 'sudo tee /etc/wsl.conf <<< ""$ResourceWslconf""'"


Invoke-Expression -Command "wsl --shutdown"

Start-Sleep -Seconds 10
