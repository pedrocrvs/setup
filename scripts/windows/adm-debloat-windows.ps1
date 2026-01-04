$ErrorActionPreference = "Stop"


$ScriptRaw = Invoke-WebRequest -Uri "https://debloat.raphi.re/" -UseBasicParsing

$ScriptBlock = [scriptblock]::Create($ScriptRaw)


& $ScriptBlock `
    -ClearStartAllUsers `
    -CombineMMTaskbarAlways `
    -CombineTaskbarAlways  `
    -DisableBing `
    -DisableClickToDo `
    -DisableCopilot `
    -DisableDesktopSpotlight `
    -DisableDVR `
    -DisableEdgeAds `
    -DisableGameBarIntegration `
    -DisableLockscreenTips `
    -DisableModernStandbyNetworking `
    -DisableNotepadAI `
    -DisablePaintAI `
    -DisableRecall `
    -DisableSettings365Ads `
    -DisableSettingsHome `
    -DisableStartPhoneLink `
    -DisableSuggestions `
    -DisableTelemetry `
    -EnableLastActiveClick `
    -HideGallery `
    -HideHome `
    -MMTaskbarModeAll `
    -Silent`
