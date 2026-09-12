@ECHO OFF

echo WELCOME TO THE SUPER AWESOME AND COOL AUTOMATIC THINGY!
echo THIS SHOULD BE RAN AS ADMINISTRATOR.
net session >nul 2>&1
if %errorLevel% == 0 (
	goto :ADMIN
) else (
	echo REQUESTING ADMINISTRATOR ACCESS...
	powershell -Command "Start-Process '%~f0' -WorkingDirectory '%~dp0' -Verb RunAs"
	exit /b
)

:ADMIN

cd /d "%~dp0"

echo.
echo COPYING EVERY CURSOR.
mkdir c:\Windows\Cursors\win7
copy *.cur c:\Windows\Cursors\win7\
copy *.ani c:\Windows\Cursors\win7\
echo.
echo IMPORTING THE COOL REGISTER FILE.
reg import "win7cursor.reg"
echo.
echo Yo we're done here, go use ur wholesome PC.
pause