$ErrorActionPreference = "Stop"


$ResourcesDirectory = Join-Path -Path $PSScriptRoot -ChildPath "..\..\resources\vscode\"

$ResourceConfigFile1 = "settings.json"

$ResourceConfigFile2 = "keybindings.json"

$ResourceExtensions = Get-Content -Path (Join-Path -Path $ResourcesDirectory -ChildPath "extensions-windows.txt")


$DestinationDirectory = Join-Path -Path $env:APPDATA -ChildPath "Code\User\"

$DestinationShortcut = Join-Path -Path ([Environment]::GetFolderPath("Desktop")) -ChildPath "Visual Studio Code.lnk"


New-Item `
    -Force `
    -ItemType "Directory" `
    -Path $DestinationDirectory


New-Item `
    -Force `
    -ItemType "SymbolicLink" `
    -Path (Join-Path $DestinationDirectory -ChildPath $ResourceConfigFile1) `
    -Target (Join-Path $ResourcesDirectory -ChildPath $ResourceConfigFile1)

New-Item `
    -Force `
    -ItemType "SymbolicLink" `
    -Path (Join-Path $DestinationDirectory -ChildPath $ResourceConfigFile2) `
    -Target (Join-Path $ResourcesDirectory -ChildPath $ResourceConfigFile2)


Remove-Item `
    -ErrorAction "SilentlyContinue" `
    -Force `
    -Path (Join-Path -Path $env:USERPROFILE -ChildPath ".vscode\") `
    -Recurse


foreach ($Extension in $ResourceExtensions) {
    code --install-extension $Extension --force
}


$COMShell = New-Object -ComObject "WScript.Shell"

$Shortcut = $COMShell.CreateShortcut($DestinationShortcut)

$Shortcut.Arguments = "--remote wsl+Debian"
$Shortcut.Description = "Visual Studio Code shortcut"
$Shortcut.TargetPath = "C:\Program Files\Microsoft VS Code\Code.exe"
$Shortcut.WindowStyle = 3
$Shortcut.WorkingDirectory = $env:USERPROFILE

$Shortcut.Save()
