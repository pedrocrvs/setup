$ErrorActionPreference = "Stop"


$ResourceConfigFile = "$PSScriptRoot\..\..\resources\wsl\.wslconfig"


New-Item `
    -ItemType "SymbolicLink" `
    -Path "$Env:USERPROFILE\.wslconfig" `
    -Target $ResourceConfigFile `
    -Force


wsl --shutdown

Start-Sleep -Seconds 10
