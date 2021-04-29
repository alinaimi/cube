/*
set @=%~f0&call "%~dp0cube-p" %*

%reset_rpt%
VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::-------------------*/ %add2script%

RUN PGM=NETWORK
  FILEI NETI[1] = "%f1%"
  FILEO NETO = "%dpn1%-addedXY.net", INCLUDE=A,B,DISTANCE,DIST,DDIST,AX,BX,AY,BY
  FILEO PRINTO[1] = "%dpn1%-addedXY.csv"

  DIST=SQRT( ( A.X -B.X)**2 + (A.Y - B.Y)**2 ) / 5280
  DDIST=DIST-LI.1.DISTANCE

  AX=A.X
  AY=A.Y
  BX=B.X
  BY=B.Y

  // PROCESS PHASE=LINKMERGE
    // IF (1==1) PRINT CSV=T, LIST=A.X(6.0),A.Y(6.0) Printo=1
  // ENDPROCESS
ENDRUN
