<#
    Registry Key/Value Creation, Modification, Deletion Functions
    By: John Sheats

    Description: I created these because I was sick and tired of generating the same If..Else
    blocks with the same prefix modifications for reg alterations. These have made scripted
    Registry changes just a few steps easier for me.
#>

# Test for the existence of a Key and create if it does not exist
function createRegKey {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path
    )
    $Path = "REGISTRY::$($Path)"
    If (-Not (Test-Path -Path $Path -ErrorAction SilentlyContinue)) {
        New-Item -Path $Path -Force
    }
}

# Test for the existence of a Key and delete it along with all subkeys/values
function deleteRegKet {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path
    )
    $Path = "REGISTRY::$($Path)"
    If (Test-Path -Path $Path -ErrorAction SilentlyContinue) {
        Remove-Item -Path $Path -Recurse -Force
    }
}

# Test for the existence of a Value. Create if it does not exist or set if it does exist
function setRegValue {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path,
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [Parameter(Mandatory = $true)]
        [string]$Value,
        [Parameter(Mandatory = $true)]
        [ValidateSet("Binary", "Dword", "ExpandString", "MultiString", "String", "QWord")]
        [string]$Type
    )
    $Path = "REGISTRY::$($Path)"
    If (-Not (Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $Path -Name $Name -Value $Value -Type $Type
    } Else {
        Set-ItemProperty -Path $Path -Name $Name -Value $Value
    }
}

# Test for the existence of a Value and delete if it exists
function deleteRegValue {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path,
        [Parameter(Mandatory = $true)]
        [string]$Name
    )
    $Path = "REGISTRY::$($Path)"
    If (Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue) {
        Remove-ItemProperty -Path $Path -Name $Name
    }
}