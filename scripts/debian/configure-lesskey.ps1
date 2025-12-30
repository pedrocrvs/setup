$ErrorActionPreference = "Stop"


$ResourceConfigFile = Join-Path -Path $PSScriptRoot -ChildPath "..\..\resources\lesskey\.lesskey"

$ResourceConfigFileWsl = wsl --distribution "Debian" --exec "wslpath" $ResourceConfigFile


wsl --distribution "Debian" --exec "cp" "--no-preserve=mode" $ResourceConfigFileWsl "/home/pedro/"
