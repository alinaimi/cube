@rem @if NOT exist "DEFAULT.VPR" xcopy "%~dp0DEFAULT.VPR" "%~dp1" /H /Y
xcopy "%~dp0DEFAULT.VPR" "%~dp1" /H /Y

@%SystemRoot%\System32\timeout.exe 3
