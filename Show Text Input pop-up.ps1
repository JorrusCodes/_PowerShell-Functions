<#
    Display a pop-up to capture text input
    By: John Sheats

    Description: This function builds a simple Windows Forms Apps with a text box
    and returns the entered text. Quite handy for a number of uses but a pain to assemble
    every time... thus the function
#>

# Display a text entry pop-up prompt and return the entered text
function popupTextEntry {
    param (
        [string]$Message = "Enter a value and click OK"
    )
    
    # Add the types for Windows Forms objects
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    # Define the Windows Forms objects
    $formPop         = New-Object System.Windows.Forms.Form
    $okButtonPop     = New-Object System.Windows.Forms.Button
    $cancelButtonPop = New-Object System.Windows.Forms.Button
    $labelPop        = New-Object System.Windows.Forms.Label
    $textBoxPop      = New-Object System.Windows.Forms.TextBox

    # Build the various components of the pop-up window
    $formPop.Text                 = "Script Prompt"
    $formPop.Size                 = New-Object System.Drawing.Size (290, 120)
    $formPop.StartPosition        = "CenterScreen"
    $formPop.FormBorderStyle      = "FixedSingle"

    $okButtonPop.Text             = "OK"
    $okButtonPop.DialogResult     = [System.Windows.Forms.DialogResult]::OK
    $okButtonPop.Size             = New-Object System.Drawing.Size (75, 23)
    $okButtonPop.Location         = New-Object System.Drawing.Point (70, 60)
    $formPop.AcceptButton         = $okButtonPop
    $formPop.Controls.Add($okButtonPop)

    $cancelButtonPop.Text         = "OK"
    $cancelButtonPop.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $cancelButtonPop.Size         = New-Object System.Drawing.Size (75, 23)
    $cancelButtonPop.Location     = New-Object System.Drawing.Point (155, 60)
    $formPop.CancelButton         = $cancelButtonPop
    $formPop.Controls.Add($cancelButtonPop)

    $labelPop.Text                = "$($Message)"
    $labelPop.TextAlign           = "MiddleCenter"
    $labelPop.Size                = New-Object System.Drawing.Size (280, 25)
    $labelPop.Location            = New-Object System.Drawing.Point (5, 5)
    $formPop.Controls.Add($labelPop)

    $textBoxPop.BorderStyle       = "FixedSingle"
    $textBoxPop.Size              = New-Object System.Drawing.Size (260, 25)
    $textBoxPop.Location          = New-Object System.Drawing.Point (10, 35)
    $formPop.Controls.Add($textBoxPop)

    # Complete setup of the Form and display it
    $formPop.Topmost = $true
    $formPop.Add_Shown({$textBoxPop.Select()})
    $result = $formPop.ShowDialog()

    # If the "OK" button was pressed and text was entered, return the text
    # otherwise return a NULL value
    If (
        ($result -eq [System.Windows.Forms.DialogResult]::OK) -and
        ($textBoxPop.Text)
    ) {
        return $textBoxPop.Text
    } Else {
        return $null
    }
}
