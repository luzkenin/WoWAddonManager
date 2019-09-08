function Get-AddonInfo {
    [CmdletBinding()]
    param (
        # Path to addon
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string]
        $Path
    )
    
    begin {
    }
    
    process {
        #$TOC = Get-Content "$($Addon.FullName)\$($Addon.Name).toc" -ErrorAction SilentlyContinue

        #$path = '/home/luzkenin/Games/world-of-warcraft/drive_c/Program Files (x86)/World of Warcraft/_classic_/Interface/AddOns/HealBot/HealBot.toc'

        $data = Get-Content $path

        $properties = @{ }

        $pattern = '## (?<propertyName>[^:]*): (?<propertyValue>.*)'

        foreach ($line in $data) {
            if ($line -match $pattern) {
                $properties[$Matches.propertyName] = $Matches.propertyValue
            }
        }
        $properties
    }
    
    end {
    }
}