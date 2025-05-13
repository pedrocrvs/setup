$ErrorActionPreference = "Stop"


$ResourceGitconfig = "$PSScriptRoot\..\..\resources\git\.gitconfig"


$DebianUser = "pedro"


Copy-Item `
    -Path $ResourceGitconfig `
    -Destination "\\wsl$\Debian\home\$DebianUser\.gitconfig" `
    -Recurse `
    -Force
