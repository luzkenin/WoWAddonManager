function Get-InstalledAddon {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
    }
    
    process {
        foreach ($Addon in (Get-ChildItem -Path C:\_retail_\Interface\AddOns)) {
            $TOC = Get-Content "$($Addon.FullName)\$($Addon.Name).toc" -ErrorAction SilentlyContinue

            $Title = ($TOC -match "## Title" | select -First 1).replace("## Title: ", "") | select -First 1
            $Version = ($TOC -match "## Version" | select -First 1).replace("## Version: ", "") | select -First 1
            $Notes = ($TOC -match "## Notes" | select -First 1).replace("## Notes: ", "") | select -First 1
            $Author = ($TOC -match "## Author" | select -First 1).replace("## Author: ", "") | select -First 1
            
            [PSCustomObject]@{
                Title   = $Addon.Name
                Version = $Version
                Notes   = $Notes
                Author  = $Author
            }
            
        }
        
    }
    
    end {
    }
}

Get-InstalledAddon