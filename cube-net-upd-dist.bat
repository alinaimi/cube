/*
set @=%~f0&call "%~dp0cube-p" %*

VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::-------------------*/ %add2script%

RUN PGM=NETWORK
  FILEI NETI[1]   = "%f1%"
  FILEO NETO      = "%dpn1%-upd-dist.net"

  DISTANCE = SQRT( ( A.X -B.X)**2 + (A.Y - B.Y)**2 ) / 5280

  // PROCESS PHASE=LINKMERGE
    // DISTANCE = SQRT( ( A.X -B.X)**2 + (A.Y - B.Y)**2 ) / 5280
  // ENDPROCESS
ENDRUN
