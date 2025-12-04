$ErrorActionPreference = "Stop"


$ResourceConfigDirectory1 = "$PSScriptRoot\..\..\resources\terminal\localstate"

$ResourceConfigDirectory2 = "$PSScriptRoot\..\..\resources\terminal\roamingstate"


$DestinationDirectory = "$Env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\"


New-Item `
    -Force `
    -ItemType "Directory" `
    -Path $DestinationDirectory

Copy-Item `
    -Destination $DestinationDirectory `
    -Force `
    -Path $ResourceConfigDirectory1 `
    -Recurse

Copy-Item `
    -Destination $DestinationDirectory `
    -Force `
    -Path $ResourceConfigDirectory2 `
    -Recurse
