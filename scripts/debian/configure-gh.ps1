$ErrorActionPreference = "Stop"


wsl --distribution "Debian" --exec "gh" "auth" "login" "--git-protocol=https" "--hostname=github.com" "--web"
