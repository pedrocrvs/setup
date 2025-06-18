$ErrorActionPreference = "Stop"


$ResourceConfigDirectory = "$PSScriptRoot\..\..\resources\ruff\"


$DebianUser = "pedro"

$DebianBash = "wsl --distribution Debian --user $DebianUser --exec /usr/bin/bash -c"


Invoke-Expression "$DebianBash 'mkdir ~/.config/ 2> /dev/null'"

Invoke-Expression "$DebianBash 'rm --recursive ~/.config/ruff/ 2> /dev/null'"


Copy-Item `
    -Path $ResourceConfigDirectory `
    -Destination "\\wsl$\Debian\home\$DebianUser\.config\" `
    -Recurse `
    -Force
