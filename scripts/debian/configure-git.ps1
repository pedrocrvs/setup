$ErrorActionPreference = "Stop"


$ResourceConfigFile = Join-Path -Path $PSScriptRoot -ChildPath "..\..\resources\git\.gitconfig"

$ResourceConfigFileWsl = wsl --distribution "Debian" --exec "wslpath" $ResourceConfigFile


wsl --distribution "Debian" --exec "cp" "--no-preserve=mode" $ResourceConfigFileWsl "/home/pedro/"
