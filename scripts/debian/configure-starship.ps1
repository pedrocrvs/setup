$ErrorActionPreference = "Stop"


$ResourceConfigFile = wsl --distribution "Debian" --exec "wslpath" "$PSScriptRoot\..\..\resources\starship\starship.toml"


wsl --distribution "Debian" --exec "mkdir" "/home/pedro/.config/" 2> $null

wsl --distribution "Debian" --exec "cp" "--no-preserve=mode" $ResourceConfigFile "/home/pedro/.config/"
