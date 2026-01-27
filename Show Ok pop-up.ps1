<#
    Display an "OK" pop-up
    By: John Sheats

    Description: Simple pop-up function to save me from digging up this method every 
    time I want it
#>

# Display a simple pop-up with an OK button
function popupOK {
    param (
        [string]$Message = "Click OK to continue..."
    )
    
    # Display the Ok pop-up
    Add-Type -AssemblyName PresentationFramework
    $msgBoxInput = [System.Windows.MessageBox]::Show(
        "$($Message)",
        "Script Pop-up",
        "Ok"
    )
}
