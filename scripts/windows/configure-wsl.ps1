$ErrorActionPreference = "Stop"


$ResourceWslconfig = "$PSScriptRoot\..\..\resources\wsl\.wslconfig"


New-Item `
    -ItemType "SymbolicLink" `
    -Path "$Env:USERPROFILE\.wslconfig" `
    -Target $ResourceWslconfig `
    -Force


Invoke-Expression -Command "wsl --shutdown"

Start-Sleep -Seconds 10
