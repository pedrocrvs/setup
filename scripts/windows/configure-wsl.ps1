$ErrorActionPreference = "Stop"


$ResourcesDirectory = Join-Path -Path $PSScriptRoot -ChildPath "..\..\resources\wsl\"

$ResourceConfigFile = ".wslconfig"


$DestinationDirectory = $env:USERPROFILE


New-Item `
    -Force `
    -ItemType "SymbolicLink" `
    -Path (Join-Path -Path $DestinationDirectory -ChildPath $ResourceConfigFile) `
    -Target (Join-Path -Path $ResourcesDirectory -ChildPath $ResourceConfigFile)


wsl --shutdown

Start-Sleep -Seconds 10
