$ErrorActionPreference = "Stop"


$DebianUser = "pedro"

$DebianBash = "wsl --distribution Debian --user $DebianUser --exec /usr/bin/bash -c"


Invoke-Expression "$DebianBash 'ln --symbolic /mnt/c/Users/pedro/Desktop/ ~/desktop'"
