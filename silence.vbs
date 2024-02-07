Set objShell = CreateObject("WScript.Shell")

batchFilePath = "run.bat"

objShell.Run "cmd /c start /b /min " & batchFilePath, 0, False
