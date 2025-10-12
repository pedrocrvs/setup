$ErrorActionPreference = "Stop"


$Services = @(
    "DiagTrack",
    "CDPSvc",
    "RmSvc",
    "lmhosts"
)

foreach ($Service in $Services) {
    try {
        Stop-Service -Name $Service -Force
        Set-Service -Name $Service -StartupType "Disabled"
        Write-Host "Disabled $Service" -ForegroundColor "Green"
    }
    catch {
        Write-Host "Failed to disable $Service" -ForegroundColor "Red"
    }
}
