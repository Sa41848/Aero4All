@ECHO OFF

set admincoolname=Administrators

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

:NOTSURE
echo.
echo Alright, have a nice day!!
pause
exit /b

:ADMIN

echo.
echo WARNING: This replaces some system files with customized one.
choice /c yn /m "Are you sure you want to proceed?"
if errorlevel 2 goto :NOTSURE

cd /d "%~dp0"

echo.
echo BACKING UP AFFECTED SYSTEM FILES...
mkdir _sysbackups
copy c:\windows\systemresources\imageres.dll.mun _sysbackups
copy c:\windows\systemresources\shell32.dll.mun _sysbackups
copy c:\windows\branding\basebrd\basebrd.dll _sysbackups
copy c:\windows\system32\shell32.dll _sysbackups
copy c:\windows\syswow64\shell32.dll _sysbackups

echo.
echo ALL YOUR BASE R BELONG TO US.
echo If this part fails, open this file in notepad and change "cooladminname" variable.
pause
takeown /f c:\windows\systemresources\imageres.dll.mun /a
takeown /f c:\windows\systemresources\shell32.dll.mun /a
takeown /f c:\windows\branding\basebrd\basebrd.dll /a
takeown /f c:\windows\system32\shell32.dll /a
takeown /f c:\windows\syswow64\shell32.dll /a
icacls "c:\windows\systemresources\imageres.dll.mun" /grant %admincoolname%:F
icacls "c:\windows\systemresources\shell32.dll.mun" /grant %admincoolname%:F
icacls "c:\windows\branding\basebrd\basebrd.dll" /grant %admincoolname%:F
icacls "c:\windows\system32\shell32.dll" /grant %admincoolname%:F
icacls "c:\windows\syswow64\shell32.dll" /grant %admincoolname%:F

echo.
echo REPLACING SYSTEM FILES WITH COOL BETTER ONES...
del %localappdata%\IconCache.db
del %localappdata%\OpenShell\DataCache.db
copy systemresources\*.* c:\windows\systemresources\
copy branding\basebrd\basebrd.dll c:\windows\branding\basebrd\basebrd.dll
copy system32\shell32.dll c:\windows\system32\shell32.dll
copy syswow64\shell32.dll c:\windows\syswow64\shell32.dll

pause