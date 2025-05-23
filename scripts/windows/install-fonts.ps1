$ErrorActionPreference = "Stop"


$ResourceFonts = Get-ChildItem -Path "$PSScriptRoot\..\..\resources\fonts\" -Include "*.otf" -Recurse


foreach ($Font in $ResourceFonts) {
    Copy-Item -Path $Font -Destination "C:\Windows\Fonts"

    New-ItemProperty `
        -Name $Font.BaseName `
        -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" `
        -PropertyType "string" `
        -Value $Font.name `
        -Force
}
