$ErrorActionPreference = "Stop"


$ResourceSettings = "$PSScriptRoot\..\..\resources\terminal\settings.json"


$ConfigurationDirectory = "$Env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\"


New-Item `
    -Path $ConfigurationDirectory `
    -ItemType "Directory" `
    -Force


Copy-Item `
    -Path $ResourceSettings `
    -Destination $ConfigurationDirectory `
    -Force
