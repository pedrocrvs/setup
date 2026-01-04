$ErrorActionPreference = "Stop"


$ResourcesDirectory = Join-Path -Path $PSScriptRoot -ChildPath "..\..\resources\fonts\"

$ResourceFonts = Get-ChildItem -Path $ResourcesDirectory -Include "*.otf" -Recurse


foreach ($Font in $ResourceFonts) {
    Copy-Item `
        -Destination "C:\Windows\Fonts" `
        -Path $Font

    New-ItemProperty `
        -Force `
        -Name $Font.BaseName `
        -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" `
        -PropertyType "string" `
        -Value $Font.name
}
