$ErrorActionPreference = "Stop"


$ResourcesDirectory = Join-Path -Path $PSScriptRoot -ChildPath "..\..\resources\git\"

$ResourceConfigFile = ".gitconfig"


$DestinationDirectory = $env:USERPROFILE


New-Item `
    -Force `
    -ItemType "SymbolicLink" `
    -Path (Join-Path -Path $DestinationDirectory -ChildPath $ResourceConfigFile) `
    -Target (Join-Path -Path $ResourcesDirectory -ChildPath $ResourceConfigFile)
