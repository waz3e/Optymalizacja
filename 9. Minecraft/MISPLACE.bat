@echo off
Color c
echo --------------------------------
echo   ZIBLACKING MISPLACER BAT METHOD : DONT SELL IT 
echo  SERVER IP  :
echo --------------------------------
Set /P server=Server Ip ?=
cls
:bitch
cls
ping %server% -n 40

sc query BITS | find /I "STATE" | find "STOPPED"
goto :start

:start
net start BITS
goto :bitch
