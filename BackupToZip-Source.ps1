<#
   This script will take all the files in the c:\source
   directory and zip them into a single date-based file 
   name. Then it's copied to the j:\source directory
   as backup.
#>

# Define the source directory and destination directory
$sourceDirectory = "C:\Source"
$destinationDirectory = "J:\Source"

# Generate a timestamp for the zip file name
$timeStamp = Get-Date -Format "yyyyMMddHHmmss"
$zipFileName = "cDriveSourceBackup_$timeStamp.zip"
$zipFilePath = Join-Path -Path $destinationDirectory -ChildPath $zipFileName

# Check if the source directory exists
if (Test-Path -Path $sourceDirectory -PathType Container) {
    # Compress the contents of the source directory into a zip file
    Compress-Archive -Path $sourceDirectory -DestinationPath $zipFilePath

    Write-Host "Contents of $sourceDirectory have been zipped to $zipFilePath."
} else {
    Write-Host "Source directory does not exist: $sourceDirectory"
}
