$ErrorActionPreference = "Stop"


$ResourceConfigDirectory = "$PSScriptRoot\..\..\resources\nushell\"


$DebianUser = "pedro"

$DebianBash = "wsl --distribution Debian --user $DebianUser --exec /usr/bin/bash -c"


Invoke-Expression "$DebianBash 'mkdir ~/.config/ 2> /dev/null'"

Invoke-Expression "$DebianBash 'rm --recursive ~/.config/nushell/ 2> /dev/null'"


Copy-Item `
    -Path $ResourceConfigDirectory `
    -Destination "\\wsl$\Debian\home\$DebianUser\.config\" `
    -Recurse `
    -Force
