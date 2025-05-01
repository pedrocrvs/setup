$ErrorActionPreference = "Stop"


$LinuxUserName = "pedro"

Invoke-Expression "wsl --distribution Debian --exec /usr/bin/bash -c 'mkdir --parents ~/.config/nushell'"

Invoke-Expression "wsl --distribution Debian --exec /usr/bin/bash -c 'rm --recursive ~/.config/nushell/*'"

Copy-Item `
    -Path "$PSScriptRoot\..\resources\nushell\*" `
    -Destination "\\wsl$\Debian\home\$LinuxUserName\.config\nushell\" `
    -Recurse `
    -Force


$Command = "/home/linuxbrew/.linuxbrew/bin/uv generate-shell-completion nushell > ~/.config/nushell/completions-uv.nu"

Invoke-Expression -Command "wsl --distribution Debian --exec /usr/bin/bash -c '$Command'"
