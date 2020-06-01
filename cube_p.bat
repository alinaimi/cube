@Echo on &@cls &@Color 3F
@rem @setlocal EnableDelayedExpansion :: cause path doesn't transfer to other bash files
@echo %path%|%SystemRoot%\System32\find /i "%SystemRoot%\System32"                   >nul||@path %SystemRoot%\System32;%SystemRoot%\System32\wbem%path%
@echo %path%|%SystemRoot%\System32\find /i      "%ProgramW6432%\Citilabs\CubeVoyager">nul||@path %ProgramW6432%\Citilabs\CubeVoyager;%path%
@echo %path%|%SystemRoot%\System32\find /i "%ProgramFiles(x86)%\Citilabs\CubeVoyager">nul||@path %ProgramFiles(x86)%\Citilabs\CubeVoyager;%path%

@set args=-PH:32767 -PW:255 /Command /CloseWhenDone /Minimize /NoSplash /Start -Sworkdir "%~dp1"
@cd/d "%~dp1"
@md "%~dp1workdir"

@set al_1=%~dp1%~nx1
@set al_2=%~dp2%~nx2

@rem path &^ pause
