$ErrorActionPreference = "Stop"


$ResourceConfigDirectory = wsl --distribution "Debian" --exec "wslpath" "$PSScriptRoot\..\..\resources\yazi\"

$ExecutableYa = "/home/linuxbrew/.linuxbrew/bin/ya"


wsl --distribution "Debian" --exec "rm" "--force" "--recursive" "/home/pedro/.config/yazi" 2> $null

wsl --distribution "Debian" --exec "mkdir" "/home/pedro/.config/" 2> $null

wsl --distribution "Debian" --exec "cp" "--no-preserve=mode" "--recursive" $ResourceConfigDirectory "/home/pedro/.config/"

wsl --distribution "Debian" --exec "bash" "-c" "$ExecutableYa pkg add yazi-rs/plugins:no-status"

wsl --distribution "Debian" --exec "bash" "-c" "$ExecutableYa ya pkg add yazi-rs/plugins:git"
