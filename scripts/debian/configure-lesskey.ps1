$ErrorActionPreference = "Stop"


$ResourceConfigFile = wsl --distribution "Debian" --exec "wslpath" "$PSScriptRoot\..\..\resources\lesskey\.lesskey"


wsl --distribution "Debian" --exec "cp" "--no-preserve=mode" $ResourceConfigFile "/home/pedro/"
