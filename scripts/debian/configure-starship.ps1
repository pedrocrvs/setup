$ErrorActionPreference = "Stop"


$ResourceConfigFile = Join-Path -Path $PSScriptRoot -ChildPath "..\..\resources\starship\starship.toml"

$ResourceConfigFileWsl = wsl --distribution "Debian" --exec "wslpath" $ResourceConfigFile


wsl --distribution "Debian" --exec "mkdir" "/home/pedro/.config/" 2> $null

wsl --distribution "Debian" --exec "cp" "--no-preserve=mode" $ResourceConfigFileWsl "/home/pedro/.config/"
