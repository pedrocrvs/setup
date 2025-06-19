$ErrorActionPreference = "Stop"


$DebianUser = "pedro"

$DebianBash = "wsl --distribution Debian --user $DebianUser --exec /usr/bin/bash -c"


Invoke-Expression "$DebianBash 'gcloud init --no-launch-browser'"

Invoke-Expression "$DebianBash 'gcloud auth configure-docker southamerica-east1-docker.pkg.dev' "
