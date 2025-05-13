$ErrorActionPreference = "Stop"


$DebianUser = "pedro"

$DebianBash = "wsl --distribution Debian --user $DebianUser --exec /usr/bin/bash -c"


Invoke-Expression "$DebianBash 'BROWSER=""/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe"" gh auth login --git-protocol=https --hostname=github.com --web'"
