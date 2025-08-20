$ErrorActionPreference = "Stop"


$ResourceConfigFile = "$PSScriptRoot\..\..\resources\git\.gitconfig"


New-Item `
    -Force `
    -ItemType "SymbolicLink" `
    -Path "$Env:USERPROFILE\.gitconfig" `
    -Target $ResourceConfigFile
