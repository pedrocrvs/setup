$ErrorActionPreference = "Stop"


$ResourceConfigFile = "$PSScriptRoot\..\..\resources\powershell\profile.ps1"


$DestinationFile = $PROFILE.CurrentUserAllHosts

$DestinationDirectory = Split-Path -Path $DestinationFile -Parent


New-Item `
    -Force `
    -ItemType "Directory" `
    -Path $DestinationDirectory

New-Item `
    -Force `
    -ItemType "SymbolicLink" `
    -Path $DestinationFile `
    -Target $ResourceConfigFile
