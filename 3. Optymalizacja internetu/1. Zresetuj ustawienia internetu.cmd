@echo off
color 06
TITLE Requesting Administrator Rights...
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
    echo Requesting Administrative Privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
TITLE Resetting Network Optimizations...
for /f "tokens=3*" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards" /f "ServiceName" /s^|findstr /i /l "ServiceName"') do (
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /f >nul 2>&1
) 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "00000010" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "00000020" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "00000499" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "00000500" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "00002000" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "00002001" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /t REG_DWORD /d "00000002" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d "00000004" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "0200" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000ff000000000000000000000000000000000000000000ff000000000000000000000000000000" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "1700" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000ff000000000000000000000000000000000000000000ff000000000000000000000000000000" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableWsd" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPCongestionControl" /f >nul 2>&1
netsh winsock reset catalog >nul 2>&1
netsh int ip reset c:resetlog.txt >nul 2>&1
netsh int ip reset C:\tcplog.txt >nul 2>&1
netsh int tcp set heuristics default >nul 2>&1
netsh int tcp set supplemental Internet congestionprovider=default >nul 2>&1
netsh int tcp set global initialRto=3000 >nul 2>&1
netsh int tcp set global MaxSynRetransmissions=2 >nul 2>&1
netsh int tcp set global autotuninglevel=default >nul 2>&1
netsh int tcp set global rss=default >nul 2>&1
netsh int tcp set global rsc=default >nul 2>&1
netsh int tcp set global chimney=default >nul 2>&1
netsh int tcp set global dca=default >nul 2>&1
netsh int tcp set global netdma=default >nul 2>&1
netsh int tcp set global ecncapability=default >nul 2>&1
netsh int tcp set global timestamps=default >nul 2>&1
netsh int tcp set global nonsackrttresiliency=default >nul 2>&1
TITLE Success!
SET msgboxTitle=Success!
SET msgboxBody=Your Network Have Been Reset Successfully!
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
ECHO msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"
exit