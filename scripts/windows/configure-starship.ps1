$ErrorActionPreference = "Stop"


$ResourceStarship = "$PSScriptRoot\..\..\resources\starship\starship.toml"


$ConfigurationDirectory = "$Env:APPDATA\starship\"


New-Item `
    -Path $ConfigurationDirectory `
    -ItemType "Directory" `
    -Force


New-Item `
    -ItemType "SymbolicLink" `
    -Path "$ConfigurationDirectory\starship.toml" `
    -Target $ResourceStarship `
    -Force
