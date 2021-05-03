::! exit codes

:success
@if [%ERRORLEVEL%]==[0] (
  @color 2A
  @rem @echo - Program returned successfully
  goto :hell
)

@rem echo %ERRORLEVEL%

:issues
@if NOT [%ERRORLEVEL%]==[0] @( @color CF )

@if [%ERRORLEVEL%]==[1] (
  @color 6E
  @echo - Program returned successfully, with warning
)

@if [%ERRORLEVEL%]==[2] (
  @echo - Program returned with failure
  @pause
)

@if [%ERRORLEVEL%]==[3] (
  @echo - Terminated by user
  @pause
)

@if %ERRORLEVEL% GEQ 4 (
  @echo - Unspecified error
  @pause
)

@%SystemRoot%\System32\timeout 20 >nul

:hell
@%SystemRoot%\System32\timeout 5 >nul
@rem @EXIT 0
