@Echo on &@cls &@Color 3F &@TITLE %~n0 (%*)
@rem @setlocal EnableDelayedExpansion :: cause path doesn't transfer to other bash files
@set p=%ProgramW6432%\Citilabs\CubeVoyager
@PATH %p%;%ProgramFiles(x86)%\Citilabs\CubeVoyager;%PATH%
@set args=-PH:32767 -PW:255 /Command /CloseWhenDone /Minimize /NoSplash /Start -Sworkdir "%~dp1"

@cd/d "%~dp1"
@md "%~dp1workdir"

@set al_1=%~dp1%~nx1
@set al_2=%~dp2%~nx2

@rem path &^ pause
