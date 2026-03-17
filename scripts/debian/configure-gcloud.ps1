$ErrorActionPreference = "Stop"


wsl --distribution "Debian" --exec "gcloud" "init" "--no-launch-browser"

wsl --distribution "Debian" --exec "gcloud" "config" "set" "core/disable_usage_reporting" "true"

wsl --distribution "Debian" --exec "gcloud" "config" "set" "survey/disable_prompts" "true"

wsl --distribution "Debian" --exec "gcloud" "auth" "configure-docker" "southamerica-east1-docker.pkg.dev"
