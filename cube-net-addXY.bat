/*
set @=%~f0&call "%~dp0cube-p" %*

%reset_rpt%
VOYAGER "%~f0" %args%

@call "%~dp0cube-q" %*&goto:eof&::-------------------*/ %add2script%

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

ENDRUN
