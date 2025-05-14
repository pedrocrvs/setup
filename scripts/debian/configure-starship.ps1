$ErrorActionPreference = "Stop"


$ResourceStarshiptoml = "$PSScriptRoot\..\..\resources\starship\starship.toml"


$DebianUser = "pedro"

$DebianBash = "wsl --distribution Debian --user $DebianUser --exec /usr/bin/bash -c"


Invoke-Expression "$DebianBash 'mkdir ~/.config/ 2> /dev/null'"


Copy-Item `
    -Path $ResourceStarshiptoml `
    -Destination "\\wsl$\Debian\home\$DebianUser\.config\" `
    -Recurse `
    -Force
