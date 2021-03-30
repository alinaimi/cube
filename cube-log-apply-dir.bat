set @=%~f0&call "%~dp0cube-p" %*

@FOR %%i in ("%~dpn1\*.log") do @(
  @rem @echo -Playing [%%i]"%%~dpnxi"
  @pause>nul|set/p p=press any key to apply: "%%~ni"
  @"%COMMANDER_PATH%\addon\sci\civil\cube\cube-log-apply.cmd" "%%~dpnxi" 
)

@%SystemRoot%\System32\timeout.exe 60
