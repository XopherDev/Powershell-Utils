<#
.SYNOPSIS
    Date and Time Output with Clipboard Functionality

.DESCRIPTION
    This PowerShell script generates the current date and time along with a line of dashes and copies the output to the clipboard.
    It prompts the user to press the spacebar to end the program. 
	
	I wrote this so that I could update lines in text fields that don't have a date/time indicator, like task notes.

.NOTES
    File Name: DateAndTimeOutput.ps1
    Author: Chris Tessay

.EXAMPLE
    PS C:\> .\DateAndTimeOutput.ps1
    Output will be copied to the clipboard. Press the spacebar to end the program...

#>

$CurrentDate = Get-Date -Format "yyyy-MM-dd"
$CurrentTime = Get-Date -Format "HH:mm:ss"
$Dashes = "-" * 50

# Generate the output string with the current date, time, and dashes
$Output = "$CurrentDate $CurrentTime`r`n$Dashes"

# Copy the output to the clipboard
Set-Clipboard -Value $Output

# Prompt the user to press the spacebar to end the program
Write-Output "Output has been copied to the clipboard. Press the spacebar to end the program...thank you"
do
{
    $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown").Character
} while ($key -ne ' ')
