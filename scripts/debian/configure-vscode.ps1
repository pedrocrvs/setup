$ErrorActionPreference = "Stop"


$ResourceExtensions = Get-Content -Path (Join-Path -Path $PSScriptRoot -ChildPath "..\..\resources\vscode\extensions-wsl.txt")

$ExecutableVisualStudioCode = "/mnt/c/Program Files/Microsoft VS Code/bin/code"


wsl --distribution "Debian" --exec "rm" "--force" "recursive" "/home/pedro/.vscode-server" 2> $null

wsl --distribution "Debian" --exec $ExecutableVisualStudioCode "--version"


foreach ($Extension in $ResourceExtensions) {
    wsl --distribution "Debian" --exec $ExecutableVisualStudioCode "--install-extension" $Extension "--force"
}


Remove-Item `
    -ErrorAction "SilentlyContinue" `
    -Force `
    -Path (Join-Path -Path $env:USERPROFILE -ChildPath "vscode-remote-wsl\") `
    -Recurse
