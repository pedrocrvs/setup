$ErrorActionPreference = "Stop"


$ResourcesDirectory = Join-Path -Path $PSScriptRoot -ChildPath "..\..\resources\powershell\"

$ResourceConfigFile = "profile.ps1"


$DestinationConfigFile = $PROFILE.CurrentUserAllHosts

$DestinationDirectory = Split-Path -Path $DestinationConfigFile -Parent


New-Item `
    -Force `
    -ItemType "Directory" `
    -Path $DestinationDirectory


New-Item `
    -Force `
    -ItemType "SymbolicLink" `
    -Path $DestinationConfigFile `
    -Target (Join-Path -Path $ResourcesDirectory -ChildPath $ResourceConfigFile)
