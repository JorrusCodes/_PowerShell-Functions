<#
    Import and parse a CSV file into an Array
    By: John Sheats

    Description: simple function to import a CSV file and parse it into an Array.
    This function was developed for a specific need to have a highly-efficient method
    which captured the filename, rows and headers in a format identical to another
    Array used for XLSX files. Import-CSV will work for most purposes of course
#>

# Get Headers and Rows from a CSV file and return as an Array
function getCSVData {
    param (
        [Parameter(Mandatory = $true)]
        [string]$FilePath
    )
    
    # Capture Headers
    $wsHeaders = [System.Collections.Generic.List[string]]::new()
    ((Get-Content $FilePath)[0] -replace '"', '' -split ',') | ForEach {
        $wsHeaders += $_
    }

    # Build Worksheets Array
    $ws = [System.Collections.Generic.List[object]]::new()
    $ws.Add([pscustomobject]@{
        Id      = "rId1";
        Name    = ($FilePath -split '\\')[-1];
        Headers = $wsHeaders;
        Rows    = (Import-Csv $FilePath)
    })

    # Return the resulting array
    return $ws
}