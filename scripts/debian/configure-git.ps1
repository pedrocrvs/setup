$ErrorActionPreference = "Stop"


$ResourceConfigFile = wsl --distribution "Debian" --exec "wslpath" "$PSScriptRoot\..\..\resources\git\.gitconfig"


wsl --distribution "Debian" --exec "cp" "--no-preserve=mode" $ResourceConfigFile "/home/pedro/"
