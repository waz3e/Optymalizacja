@echo off

:bcdedits
TITLE Tweaking BCD...
bcdedit /set useplatformtick yes
bcdedit /set disabledynamictick yes
goto redists

:redists
TITLE Downloading the Redist Installer...
powershell Invoke-WebRequest "https://cdn.discordapp.com/attachments/798652558351794196/820603647082889226/VisualCppRedist_AIO_x86_x64.exe" -OutFile "%temp%\VisualCppRedist_AIO_x86_x64.exe"
TITLE Installing the Redists...
%temp%\VisualCppRedist_AIO_x86_x64.exe



:install
TITLE Downloading and installing the Timer Resolution Service...
powershell Invoke-WebRequest "https://cdn.discordapp.com/attachments/798652558351794196/798668491921162271/SetTimerResolutionService.exe" -OutFile "%temp%\SetTimerResolutionService.exe"
move "%temp%\SetTimerResolutionService.exe" "C:\"
"C:\SetTimerResolutionService.exe" -install
sc start STR
goto success

:success
SET msgboxTitle=Success
SET msgboxBody=The service has been installed and activated.
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
ECHO msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"
exit