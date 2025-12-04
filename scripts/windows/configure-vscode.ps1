$ErrorActionPreference = "Stop"


$ResourceConfigFile1 = "$PSScriptRoot\..\..\resources\vscode\settings.json"

$ResourceConfigFile2 = "$PSScriptRoot\..\..\resources\vscode\keybindings.json"

$ResourceExtensions = Get-Content -Path "$PSScriptRoot\..\..\resources\vscode\extensions-windows.txt"


$DestinationDirectory = "$Env:APPDATA\Code\User\"


New-Item `
    -Force `
    -ItemType "Directory" `
    -Path $DestinationDirectory


New-Item `
    -Force `
    -ItemType "SymbolicLink" `
    -Path "$DestinationDirectory\settings.json" `
    -Target $ResourceConfigFile1

New-Item `
    -Force `
    -ItemType "SymbolicLink" `
    -Path "$DestinationDirectory\keybindings.json" `
    -Target $ResourceConfigFile2


Remove-Item `
    -ErrorAction "SilentlyContinue" `
    -Force `
    -Path "$Env:USERPROFILE\.vscode\" `
    -Recurse

foreach ($Extension in $ResourceExtensions) {
    code --install-extension $Extension --force
}


$COMShell = New-Object -ComObject "WScript.Shell"

$Shortcut = $COMShell.CreateShortcut("$Env:USERPROFILE\Desktop\Visual Studio Code.lnk")

$Shortcut.Arguments = "--remote wsl+Debian"
$Shortcut.Description = "Visual Studio Code shortcut"
$Shortcut.TargetPath = "C:\Program Files\Microsoft VS Code\Code.exe"
$Shortcut.WindowStyle = 3
$Shortcut.WorkingDirectory = $Env:USERPROFILE

$Shortcut.Save()
