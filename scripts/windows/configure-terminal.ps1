$ErrorActionPreference = "Stop"


$ResourcesDirectory = Join-Path -Path $PSScriptRoot -ChildPath "..\..\resources\terminal\"

$ResourceConfigDirectory1 = "LocalState"

$ResourceConfigDirectory2 = "RoamingState"


$DestinationDirectory = Join-Path -Path $env:LOCALAPPDATA -ChildPath "Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\"


New-Item `
    -Force `
    -ItemType "Directory" `
    -Path $DestinationDirectory


Copy-Item `
    -Destination $DestinationDirectory `
    -Force `
    -Path (Join-Path -Path $ResourcesDirectory -ChildPath $ResourceConfigDirectory1) `
    -Recurse

Copy-Item `
    -Destination $DestinationDirectory `
    -Force `
    -Path (Join-Path -Path $ResourcesDirectory -ChildPath $ResourceConfigDirectory2) `
    -Recurse
