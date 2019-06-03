function Get-Author {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.Array]
        $Source
    )
    
    begin {
    }
    
    process {
        ($Source | Select-String -Pattern "## Author:") -replace ('## Author: ', '')
    }
    
    end {
    }
}