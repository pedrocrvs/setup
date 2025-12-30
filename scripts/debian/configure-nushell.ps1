$ErrorActionPreference = "Stop"


$ResourceConfigDirectory = Join-Path -Path $PSScriptRoot -ChildPath "..\..\resources\nushell\"

$ResourceConfigDirectoryWsl = wsl --distribution "Debian" --exec "wslpath" $ResourceConfigDirectory


wsl --distribution "Debian" --exec "mkdir" "/home/pedro/.config/" 2> $null

wsl --distribution "Debian" --exec "cp" "--no-preserve=mode" "--recursive" $ResourceConfigDirectoryWsl "/home/pedro/.config/"
