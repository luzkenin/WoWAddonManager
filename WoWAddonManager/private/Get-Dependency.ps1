function Get-Dependency {
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
        ($Source | Select-String -Pattern "## Dependencies:") -replace ('## Dependencies: ', '')
    }
    
    end {
    }
}