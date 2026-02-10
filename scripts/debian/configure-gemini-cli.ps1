$ErrorActionPreference = "Stop"


$ResourceConfigFile = Join-Path -Path $PSScriptRoot -ChildPath "..\..\resources\gemini-cli\settings.json"

$ResourceConfigFileWsl = wsl --distribution "Debian" --exec "wslpath" $ResourceConfigFile


wsl --distribution "Debian" --exec "mkdir" "/home/pedro/.gemini/" 2> $null

wsl --distribution "Debian" --exec "cp" "--no-preserve=mode" $ResourceConfigFileWsl "/home/pedro/.gemini/"
