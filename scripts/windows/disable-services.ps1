$ErrorActionPreference = "Stop"


$ServicesToDisable = @(
    "CDPSvc"
    "CDPUserSvc"
    "DiagTrack"
    "edgeupdate"
    "iphlpsvc"
    "lfsvc"
    "lmhosts"
    "MapsBroker"
    "Spooler"
    "SysMain"
    "TrkWks"
)

foreach ($Service in $ServicesToDisable) {
    Set-Service -Name $Service -StartupType "Disabled"
}
