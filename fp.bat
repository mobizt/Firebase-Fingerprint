@echo off
setlocal enabledelayedexpansion
for /f "tokens=1-2 skip=1 delims=^." %%a in ('@wmic os get osarchitecture') do (
	if not "%%a"=="" (
		set  "os_ar=%%a"		
		goto :begin
	)
)
:begin
if %os_ar%==64-bit set op="C:\Program Files (x86)\GnuWin32\bin"
if %os_ar%==32-bit set op="C:\Program Files\GnuWin32\bin"
set h="test.firebaseio.com"
set cf=%USERPROFILE%\f.cert
set of=%USERPROFILE%\o.txt
set t1=STEP 1: ACQUIRE CERTIFICATE...
set t2=STEP 2: FINISHED
set t3=Openssl tool doesn't exist  
set t4=No internet connection
set emsg1=Please install openssl tool at %op%.
set emsg2=Unable to access to Firebase server.
set emsg3=Please check your internet connection.
if not exist %op%/openssl.exe goto :f_error
ping google.com -n 1 -w 1000 >nul
if errorlevel 1 goto :i_error
color 1f
@title %t1%
cd\
cd %op%
cls
echo "" | openssl s_client -host %h% -port 443 | sed -ne "/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p"  > %cf%
openssl x509 -noout -fingerprint -sha1 -inform pem -in %cf% > %of%
set /p tk=<%of%
for /f "tokens=2* delims=.\=" %%i in ( "%tk%" ) do set  r=%%i
@title %t2%
set f=%r::=%
call :lc f
cls
echo %f%
del %of%
del %cf%
pause >nul 
:lc
set %~1=!%~1:A=a!
set %~1=!%~1:B=b!
set %~1=!%~1:C=c!
set %~1=!%~1:D=d!
set %~1=!%~1:E=e!
set %~1=!%~1:F=f!
set %~1=!%~1:G=g!
set %~1=!%~1:H=h!
set %~1=!%~1:I=i!
set %~1=!%~1:J=j!
set %~1=!%~1:K=k!
set %~1=!%~1:L=l!
set %~1=!%~1:M=m!
set %~1=!%~1:N=n!
set %~1=!%~1:O=o!
set %~1=!%~1:P=p!
set %~1=!%~1:Q=q!
set %~1=!%~1:R=r!
set %~1=!%~1:S=s!
set %~1=!%~1:T=t!
set %~1=!%~1:U=u!
set %~1=!%~1:V=v!
set %~1=!%~1:W=w!
set %~1=!%~1:X=x!
set %~1=!%~1:Y=y!
set %~1=!%~1:Z=z!
goto:eof
:f_error
color 4f
@title %t3%
cls
echo %emsg1%
pause >nul
:i_error
color 4f
@title %t4%
cls
echo %emsg2%
echo %emsg3%
pause >nul
