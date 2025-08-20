$ErrorActionPreference = "Stop"


wsl --distribution "Debian" --exec "gcloud" "init" "--no-launch-browser"

wsl --distribution "Debian" --exec "gcloud" "auth" "configure-docker" "southamerica-east1-docker.pkg.dev"
