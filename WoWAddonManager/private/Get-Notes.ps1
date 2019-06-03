function Get-Note {
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
        ($Source | Select-String -Pattern "## Notes:") -replace ('## Notes: ', '')
    }
    
    end {
    }
}