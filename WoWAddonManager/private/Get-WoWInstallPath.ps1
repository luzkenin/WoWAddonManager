function Get-WoWInstallPath {
    [cmdletbinding()]
    param(

    )

    Write-Verbose "Attempting to find WoW install path..."

    if ($IsWindows) {
        try {

            $wowInstallPath = (Get-Item 'hklm:\SOFTWARE\WOW6432Node\Blizzard Entertainment\World of Warcraft').GetValue('InstallPath')
            $addonsFolder = "$($wowInstallPath)Interface\AddOns"

            $wowInstallInfo = [PSCustomObject]@{

                AddonsFolder   = $addonsFolder
                WowInstallPath = $wowInstallPath

            }

            return $wowInstallInfo

        }

        catch {

            $errorMessage = $_.Exception.Message
            throw "Error determining WoW Install Path/ElvUi Version -> [$errorMessage]!"
            break

        }
    }
    if ($IsLinux) {
        if (Test-Path -Path "$HOME/Games/world-of-warcraft/drive_c/Program Files (x86)/World of Warcraft/") {
            $wowInstallPath = "$HOME/Games/world-of-warcraft/drive_c/Program Files (x86)/World of Warcraft/"
            $addonsFolder = "$($wowInstallPath)Interface/AddOns"

            $wowInstallInfo = [PSCustomObject]@{

                AddonsFolder   = $addonsFolder
                WowInstallPath = $wowInstallPath

            }
            return $wowInstallInfo
        }
    }
}