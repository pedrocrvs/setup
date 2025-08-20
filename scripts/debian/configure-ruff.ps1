$ErrorActionPreference = "Stop"


$ResourceConfigDirectory = wsl --distribution "Debian" --exec "wslpath" "$PSScriptRoot\..\..\resources\ruff\"

wsl --distribution "Debian" --exec "mkdir" "/home/pedro/.config/" 2> $null

wsl --distribution "Debian" --exec "cp" "--no-preserve=mode" "--recursive" $ResourceConfigDirectory "/home/pedro/.config/"
