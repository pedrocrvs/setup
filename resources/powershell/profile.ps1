function Format-ByteSize {
    param (
        [Parameter(Mandatory)]
        [ulong]$Bytes
    )

    $Units = @("Bytes", "KB", "MB", "GB", "TB")

    $Size = [double]$Bytes

    $Index = 0
    $IndexMax = $Units.Count - 1

    while ($Size -ge 1024 -and $Index -lt $IndexMax) {
        $Size /= 1024
        $Index++
    }

    $SizeRounded = [math]::Round($Size, 2)

    return "$SizeRounded $($Units[$Index])"
}



function Get-IPAddress {
    param (
        [Parameter(Mandatory = $false)]
        [string]$Uri = "http://ipinfo.io/ip"
    )
    try {
        $ResponseContent = Invoke-WebRequest -Uri $Uri | Select-Object -ExpandProperty "Content"
        $IPAddress = $ResponseContent.Trim()
        return $IPAddress
    }
    catch {
        Write-Host "Failed to fetch the IP address" -ForegroundColor "Red"
    }
}



function Get-PathEntries {
    return $env:PATH -split ";" | Where-Object { $_.Trim() -ne "" }
}



function Invoke-CustomGetChildItem {
    param (
        [Parameter(Mandatory = $false)]
        [string]$Path = "."
    )

    Get-ChildItem -Path $Path -Force |
    Where-Object { -not ($_.Attributes -band [System.IO.FileAttributes]::System) } |
    ForEach-Object {
        $IsDirectory = $_.PsIsContainer

        [PSCustomObject]@{
            Name           = if ($IsDirectory) { "$($_.Name)/" } else { $_.Name }
            Extension      = $_.Extension.ToLowerInvariant()
            Size           = if ($IsDirectory) { '' } else { Format-ByteSize $_.Length }
            LastWriteTime  = $_.LastWriteTime.ToString("yyyy-MM-dd HH:mm:ss")
            IsNotDirectory = -not $IsDirectory
        }
    } |
    Sort-Object -Property IsNotDirectory, Extension, Name |
    Select-Object -Property Name, Size, LastWriteTime
}



function Remove-Junk {
    $ErrorActionPreference = "SilentlyContinue"

    $JunkItems = @(
        "$env:APPDATA\VoiceAccess"
        "$env:LOCALAPPDATA\cache"
        "$env:LOCALAPPDATA\CEF"
        "$env:LOCALAPPDATA\Comms"
        "$env:LOCALAPPDATA\ConnectedDevicesPlatform"
        "$env:LOCALAPPDATA\CrashDumps"
        "$env:LOCALAPPDATA\D3DSCache"
        "$env:LOCALAPPDATA\IconCache.db"
        "$env:LOCALAPPDATA\NVIDIA Corporation"
        "$env:LOCALAPPDATA\NVIDIA"
        "$env:LOCALAPPDATA\PeerDistRepub"
        "$env:LOCALAPPDATA\PlaceholderTileLogoFolder"
        "$env:LOCALAPPDATA\Programs"
        "$env:LOCALAPPDATA\Publishers"
        "$env:LOCALAPPDATA\SquirrelTemp"
        "$env:LOCALAPPDATA\VirtualStore"
        "$env:USERPROFILE\.cache"
        "$env:USERPROFILE\Documents\Custom Office Templates"
        "$env:USERPROFILE\Documents\Power BI Desktop"
        "$env:USERPROFILE\Favorites"
        "$env:USERPROFILE\Microsoft"
        "$env:USERPROFILE\Saved Games"
    )

    $JunkDirectoriesItems = @(
        "$env:LOCALAPPDATA\Microsoft\Windows\WER\"
        "$env:LOCALAPPDATA\Temp\"
        "$env:USERPROFILE\Downloads\"
        "$env:USERPROFILE\Music\"
        "$env:USERPROFILE\Pictures\"
        "$env:USERPROFILE\Videos\"
    ) | Get-ChildItem

    $CacheAndLogsParentDirectories = @(
        "$env:LOCALAPPDATA\Microsoft\OneDrive\"
        "$env:LOCALAPPDATA\Microsoft\Teams\"
        "$env:LOCALAPPDATA\OneDrive\"
    )

    $CacheAndLogsDirectories = Get-ChildItem -Path $CacheAndLogsParentDirectories -Recurse -Directory | Where-Object { $_.Name -match 'cache|log' }

    $Items = $JunkItems + $JunkDirectoriesItems + $CacheAndLogsDirectories

    foreach ($Item in $Items) {
        if (Test-Path -Path $Item) {
            Remove-Item -Path $Item -Recurse -Force

            if (Test-Path -Path $Item) {
                Write-Host "Failed to remove $Item" -ForegroundColor "Red"
            }
            else {
                Write-Host "Removed $Item" -ForegroundColor "Green"
            }
        }
    }
}



function Set-ClipboardToIPAddress {
    try {
        $IPAddress = Get-IPAddress
        Set-Clipboard -Value $IPAddress
        Write-Host "$IPAddress has been copied to the clipboard" -ForegroundColor "Green"
    }
    catch {
        Write-Host "Failed to copy the IP address" -ForegroundColor "Red"
    }
}



function Start-MouseMovement {
    param (
        [Parameter(Mandatory = $false)]
        [int]$MovementIntervalSeconds = 5,

        [Parameter(Mandatory = $false)]
        [int]$VertexPauseMilliseconds = 250,

        [Parameter(Mandatory = $false)]
        [ValidateScript({ $_ % 2 -eq 0 })]
        [int]$TriangleSidePixels = 40
    )

    Add-Type -AssemblyName "System.Windows.Forms"

    Add-Type -TypeDefinition @"
            public static class Mouse {
                private const int MOUSEEVENTF_MOVE = 0x0001;

                [System.Runtime.InteropServices.DllImport("user32.dll")]
                private static extern void SetCursorPos(int X, int Y);

                [System.Runtime.InteropServices.DllImport("user32.dll")]
                private static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);

                public static void SetPosition(int x, int y) => SetCursorPos(x, y);

                public static void Move(int dx, int dy) => mouse_event(MOUSEEVENTF_MOVE, dx, dy, 0, 0);
            }
"@

    $TriangleHalfSidePixels = $TriangleSidePixels / 2

    $ScreenPixelsWidth = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width
    $ScreenPixelsHeight = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height

    $ScreenCenterX = [math]::Floor($ScreenPixelsWidth / 2)
    $ScreenCenterY = [math]::Floor($ScreenPixelsHeight / 2)

    while ($true) {
        [Mouse]::SetPosition($ScreenCenterX, $ScreenCenterY)
        Start-Sleep -Milliseconds $VertexPauseMilliseconds

        [Mouse]::Move($TriangleHalfSidePixels, $TriangleSidePixels)
        Start-Sleep -Milliseconds $VertexPauseMilliseconds

        [Mouse]::Move(-$TriangleSidePixels, 0)
        Start-Sleep -Milliseconds $VertexPauseMilliseconds

        [Mouse]::Move($TriangleHalfSidePixels, - $TriangleSidePixels)
        Start-Sleep -Milliseconds $VertexPauseMilliseconds

        Start-Sleep -Seconds $MovementIntervalSeconds
    }
}



function Update-Winget {
    winget upgrade --source "winget" --scope "user" --all

    Start-Process "winget" -ArgumentList "upgrade --source winget --scope machine --all" -Verb "RunAs"
}



Set-Alias -Name "ip" -Value Set-ClipboardToIPAddress
Set-Alias -Name "isudo" -Value Get-ImAdministrator
Set-Alias -Name "junk" -Value Remove-Junk
Set-Alias -Name "ll" -Value Invoke-CustomGetChildItem
Set-Alias -Name "mouse" -Value Start-MouseMovement
Set-Alias -Name "pp" -Value Get-PathEntries



Set-PSReadLineOption -Colors @{
    Command          = "`e[97m" # ANSI white bright
    Comment          = "`e[2;32m" # ANSI green dimmed
    Default          = "`e[97m" # ANSI white bright
    Error            = "`e[91m" # ANSI red bright
    InlinePrediction = "`e[2;37m" # ANSI white dimmed
    Keyword          = "`e[95m" # ANSI magenta bright
    Member           = "`e[97m" # ANSI white bright
    Number           = "`e[92m" # ANSI green bright
    Operator         = "`e[95m" # ANSI magenta bright
    Parameter        = "`e[97m" # ANSI white bright
    String           = "`e[32m" # ANSI green
    Type             = "`e[97m" # ANSI white bright
    Variable         = "`e[96m" # ANSI cyan bright
}



$env:LESSHISTFILE = "-"



function prompt {
    return "`n$PWD`n> "
}
