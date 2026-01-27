<#
    Display an file browse dialog box
    By: John Sheats

    Description: Function to dispaly a standard file browse dialog box and
    to return the full path of the selected file. So much more fun that hard-
    coding a source file path every time.
#>

# Displays a file browse dialog box and returns the full file path of the selected file
function popupFileBrowse {
    param (
        [string]$initialDirectory = "c:fso",
        [string]$fileFilter = "All files (*.*)| *.*"
    )

    # If a File Filter was supplied, format it for use
    If ($fileFilter -ne "All files (*.*)| *.*") {
        $fileFilter = "Files ($($fileFilter))| $($fileFilter)"
    }

    # Build and display the browse dialog
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
    $openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $openFileDialog.InitialDirectory = $initialDirectory
    $openFileDialog.Filter = $fileFilter
    $openFileDialog.ShowDialog() | Out-Null

    # Return the full path of the selected file
    return $openFileDialog.FileName
}
