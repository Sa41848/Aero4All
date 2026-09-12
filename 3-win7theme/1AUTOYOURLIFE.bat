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
echo COPYING THEME...
mkdir c:\windows\resources\themes\BasicAero
xcopy /s BasicAero c:\windows\resources\themes\BasicAero
MyCoolAero.theme
echo.
echo Yo we're done here, go use ur wholesome PC.
pause