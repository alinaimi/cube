@path %SystemRoot%\System32;%SystemRoot%\System32\wbem;%SystemRoot%\System32\WindowsPowerShell\v1.0;%path%
@set fn_=%~n0
@set fn=%fn_:~5,99%.exe
@echo on &@Color 4E &cls / &@TITLE idling %fn% (%*)

::! idle:          64    (or "idle")
::! below normal:  16384 (or "below normal")
::! normal:        32    (or "normal")
::! above normal:  32768 (or "above normal")
::! high priority: 128   (or "high priority")
::! real time:     256   (or "realtime")

wmic process where name="%fn%"           CALL setpriority "idle"
wmic process where name="APPMANAGER.exe" CALL setpriority "idle"
wmic process where name="CLUSTER.exe"    CALL setpriority "idle"
wmic process where name="RUNTPP.exe"     CALL setpriority "idle"
wmic process where name="TMONITOR.exe"   CALL setpriority "idle"
wmic process where name="TPPLUS.exe"     CALL setpriority "idle"
wmic process where name="VOYAGER.exe"    CALL setpriority "idle"

@%SystemRoot%\System32\timeout.exe 3
