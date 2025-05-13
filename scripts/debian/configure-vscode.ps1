$ErrorActionPreference = "Stop"


$ResourceExtensions = Get-Content -Path "$PSScriptRoot\..\..\resources\vscode\extensions-wsl.txt"


$DebianUser = "pedro"

$DebianBash = "wsl --distribution Debian --user $DebianUser --exec /usr/bin/bash -c"


$BinaryVisualStudioCode = "/mnt/c/Program\ Files/Microsoft\ VS\ Code/bin/code"


Invoke-Expression -Command "$DebianBash 'rm --force ~/.vscode-server 2> /dev/null'"


Invoke-Expression -Command "$DebianBash '$BinaryVisualStudioCode --version'"

foreach ($Extension in $ResourceExtensions) {
    Invoke-Expression "$DebianBash '$BinaryVisualStudioCode --install-extension $Extension --force'"
}


Remove-Item -Path "$Env:USERPROFILE\vscode-remote-wsl\" -Recurse -Force -ErrorAction "SilentlyContinue"
