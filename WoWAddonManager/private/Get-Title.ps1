function Get-Title {
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
        ($Source | Select-String -Pattern "## Title:") -replace ('(## Title: |## Title:)', '') -replace ('(\|c[A-Fa-f0-9]{8}|\|r\|c[A-Fa-f0-9]{8}|\|r \|c[A-Fa-f0-9]{8}|<\|r\|c[A-Fa-f0-9]{8}|>\|r \|c[A-Fa-f0-9]{8}|\|r)', '')
    }
    
    end {
    }
}