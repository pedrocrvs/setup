$ErrorActionPreference = "Stop"


$ResourceProfile = "$PSScriptRoot\..\..\resources\powershell\profile.ps1"


$ConfigurationDirectory = Split-Path -Path $PROFILE.CurrentUserAllHosts -Parent


New-Item `
    -Path $ConfigurationDirectory `
    -ItemType "Directory" `
    -Force

New-Item `
    -ItemType "SymbolicLink" `
    -Path "$ConfigurationDirectory/profile.ps1" `
    -Target $ResourceProfile `
    -Force
