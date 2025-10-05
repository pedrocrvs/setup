$ErrorActionPreference = "Stop"


$ResourceConfigDirectory = wsl --distribution "Debian" --exec "wslpath" "$PSScriptRoot\..\..\resources\broot\"

$ExecutableBroot = "/home/linuxbrew/.linuxbrew/bin/broot"

$ResourceNushellModule = "/home/pedro/.config/broot/nushell_broot.nu"


wsl --distribution "Debian" --exec "rm" "--force" "--recursive" "/home/pedro/.config/broot" 2> $null

wsl --distribution "Debian" --exec "mkdir" "/home/pedro/.config/" 2> $null

wsl --distribution "Debian" --exec "cp" "--no-preserve=mode" "--recursive" $ResourceConfigDirectory "/home/pedro/.config/"

wsl --distribution "Debian" --exec "bash" "-c" "$ExecutableBroot --print-shell-function nushell > $ResourceNushellModule"
