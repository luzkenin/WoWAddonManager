function Get-InstalledAddon {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
    }
    
    process {
        foreach ($Addon in (Get-ChildItem -Path C:\_retail_\Interface\AddOns)) {
            $TOC = Get-Content "$($Addon.FullName)\$($Addon.Name).toc" -ErrorAction SilentlyContinue

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
            
        }
        
    }
    
    end {
    }
}

#Get-InstalledAddon