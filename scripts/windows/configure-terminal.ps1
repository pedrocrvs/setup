$ErrorActionPreference = "Stop"


$ResourceConfigFile = "$PSScriptRoot\..\..\resources\terminal\settings.json"


$DestinationDirectory = "$Env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\"


New-Item `
    -Force `
    -ItemType "Directory" `
    -Path $DestinationDirectory

Copy-Item `
    -Destination $DestinationDirectory `
    -Force `
    -Path $ResourceConfigFile
