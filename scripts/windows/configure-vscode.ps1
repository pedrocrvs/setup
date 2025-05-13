$ErrorActionPreference = "Stop"


$ResourceSettings = "$PSScriptRoot\..\..\resources\vscode\settings.json"

$ResourceKeybindings = "$PSScriptRoot\..\..\resources\vscode\keybindings.json"

$ResourceExtensions = Get-Content -Path "$PSScriptRoot\..\..\resources\vscode\extensions-windows.txt"


$ConfigurationDirectory = "$Env:APPDATA\Code\User\"


New-Item `
    -Path $ConfigurationDirectory `
    -ItemType "Directory" `
    -Force

Remove-Item `
    -Path "$Env:USERPROFILE\.vscode" `
    -Recurse `
    -Force `
    -ErrorAction "SilentlyContinue"


New-Item `
    -ItemType "SymbolicLink" `
    -Path "$ConfigurationDirectory\settings.json" `
    -Target $ResourceSettings `
    -Force

New-Item `
    -ItemType "SymbolicLink" `
    -Path "$ConfigurationDirectory\keybindings.json" `
    -Target $ResourceKeybindings `
    -Force

foreach ($Extension in $ResourceExtensions) {
    Invoke-Expression "code --install-extension $Extension --force"
}


$COMShell = New-Object -ComObject "WScript.Shell"

$Shortcut = $COMShell.CreateShortcut("$Env:USERPROFILE\Desktop\Visual Studio Code.lnk")

$Shortcut.TargetPath = "C:\Program Files\Microsoft VS Code\Code.exe"
$Shortcut.WorkingDirectory = $Env:USERPROFILE
$Shortcut.WindowStyle = 3
$Shortcut.Description = "Visual Studio Code shortcut"

$Shortcut.Save()
