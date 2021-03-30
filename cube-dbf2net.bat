/*
set @=%~f0&call "%~dp0cube-p" %*

VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::------------------------------------------------------------------------*/ %add2script%

RUN PGM=NETWORK; PRNFILE="%PRNFILE%"

FILEI NODEI[1] = "%dpnx1%"
FILEI LINKI[1] = "%dpnx2%"
NETO = "%dp1%%parent1%-%n1%_%n2%.net"

ENDRUN
