<#
    Display a "Yes"/"No" Dialog prompt and capture the clicked button
    By: John Sheats

    Description: As very simply function to present a Yes/No prompt and record whether "Yes"
    was selected or not. "No" and null result (pop-up with closed without a button press)
    both return $false
#>

# Display a Yes/Not prompt and return $true if "Yes" was clicked and $false if not
function popupYesNo {
    param (
        [string]$Message = "Do you want to continue?"
    )
    
    # Display the Yes/No prompt
    Add-Type -AssemblyName PresentationFramework
    $msgBoxInput = [System.Windows.MessageBox]::Show(
        "$($Message)",
        "Script Prompt",
        "YesNo"
    )

    # Return the prompt result
    If ($msgBoxInput -eq "Yes") {
        return $true
    } Else{
        return $false
    }
}
