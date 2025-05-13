$ErrorActionPreference = "Stop"


$ResourceGitconfig = "$PSScriptRoot\..\..\resources\git\.gitconfig"


New-Item `
    -ItemType "SymbolicLink" `
    -Path "$Env:USERPROFILE\.gitconfig" `
    -Target $ResourceGitconfig `
    -Force
