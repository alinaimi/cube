@path %SystemRoot%\System32;%SystemRoot%\System32\wbem;%SystemRoot%\System32\WindowsPowerShell\v1.0;%path%
@set fn_=%~n0
@set fn=%fn_:~5,99%.exe
echo on &color 4E &cls &@title Killing %fn% (%*)

@REM TASKKILL /F /T /FI "IMAGENAME eq %fn%"
TASKKILL /F /T /FI "IMAGENAME eq APPMANAGER.exe"
TASKKILL /F /T /FI "IMAGENAME eq CLUSTER.exe"
TASKKILL /F /T /FI "IMAGENAME eq RUNTPP.exe"
TASKKILL /F /T /FI "IMAGENAME eq TMONITOR.exe"
TASKKILL /F /T /FI "IMAGENAME eq TPPLUS.exe"
TASKKILL /F /T /FI "IMAGENAME eq VOYAGER.exe"

@timeout.exe 3&@EXIT 0
