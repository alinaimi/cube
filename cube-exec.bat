set @=%~f0&call "%~dp0cube-p" %*
@call "%~dp0cube-env-cog" %*

::!--- Run
@rem "%ProgramW6432%\Citilabs\CubeVoyager\TPPLUS.EXE" "%1" /Command /CloseWhenDone /Minimize /NoSplash /Start /High -Sworkdir "%P""
@rem "%ProgramW6432%\Citilabs\CubeVoyager\VOYAGER.EXE" "%~f1" %args%
@REM "%ProgramFiles(x86)%\Citilabs\Cube\CUBE.EXE" "%~f0" %*
@rem @%ComSpec% /v /c "(set cs=%windir%\SysWoW64\cscript&&IF [%PROCESSOR_ARCHITECTURE%]==[x86] set cs=cscript)&&@%ComSpec% /v /c !cs! //nologo //e:javascript "%~f0" %*" &::x64 is missing alot of functions
@REM VOYAGER "%~f0" %args%
@rem TPPLUS "%~f0" %args%
@REM RUNTPP VOYAGER "%~f0" %args%

@start "" VOYAGER "%~f1" %args%

@timeout.exe 5
