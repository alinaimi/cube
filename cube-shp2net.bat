/*
set @=%~n0 &call "%~dp0cube-p" %*

VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::------------------------------------------------------------------------*/

;print file="%dp1%\workdir\%@%-%n1%%x1%-%dt%.log", list='%dpnx1%',' ','@ali@',X(6.0)
RUN PGM=NETWORK PRNFILE="%dp1%\workdir\%@%-%n1%%x1%-%dt%.PRN"

FILEI LINKI[1] = "%dpnx1%"
FILEO NETO = "%~dpn1%.net",
;EXCLUDE =  OBJECTID, Shape, A, B, A1, B1, Flag

ENDRUN
