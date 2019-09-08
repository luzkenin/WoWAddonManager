function Get-InstalledAddon {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
    }
    
    process {
        foreach ($Addon in (Get-ChildItem -Path C:\_retail_\Interface\AddOns)) {
            $TOC = Get-Content "$($Addon.FullName)\$($Addon.Name).toc" -ErrorAction SilentlyContinue

            #$path = 'D:\Games\Blizzard\World of Warcraft\_classic_\Interface\AddOns\ISBoxer\ISBoxer.toc'

            $data = Get-Content $TOC

            $properties = @{ }

            $pattern = '## (?<propertyName>[^:]*): (?<propertyValue>.*)'

            foreach ($line in $data) {
                if ($line -match $pattern) {
                    $properties[$Matches.propertyName] = $Matches.propertyValue
                }
            }
            
            
            <#
            $Title = Get-Title -Source $TOC
            $Version = Get-Version -Source $TOC
            $Notes = Get-Note -Source $TOC
            $Author = Get-Author -Source $TOC
            $Dependencies = Get-Dependency -Source $TOC
            
            [PSCustomObject]@{
                Title        = $Title
                Version      = $Version
                Notes        = $Notes
                Author       = $Author
                Dependencies = $Dependencies
            }
            #>
        }
        
    }
    
    end {
    }
}

#Get-InstalledAddon


