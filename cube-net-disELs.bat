/*
set @=%~n0 &call "%~dp0cube-p" %*

VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::██████████████████████████████████████████████████████*/

print file="%dp1%\workdir\%@%-%n1%%x1%-%dt%.log", list='%dpnx1%',' ','@ali@',X(6.0)

RUN PGM=NETWORK
NETI= "%dpnx1%"
NETO= "%dpn1%-ELs-Disabled.NET"

phase=linkmerge
  IF (li.1.ROADTYPE == 2)  ; disable ELs
   I4AMTIME=999999
   I4PMTIME=999999
   I4M1TIME=999999
   I4M2TIME=999999
   I4N1TIME=999999
   I4N2TIME=999999
  ENDIF
ENDPHASE

ENDRUN
