function Get-Version {
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
        ($Source | Select-String -Pattern "## Version:") -replace ('## Version: ', '')
    }
    
    end {
    }
}