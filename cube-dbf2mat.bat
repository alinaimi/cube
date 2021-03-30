/*
set @=%~f0&call "%~dp0cube-p" %*

set zones=3722
set zones=5998
set zones=5996
set zones=5986

VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout.exe 10 &goto:eof&::--------------------------------------------------------------------*/ %add2script%

RUN PGM=MATRIX PRNFILE="%PRNFILE%"
  //FILEI MATI[1] = "%dpnx1%", PATTERN=IJ:V, FIELDS=O,D,TRIPS
  //FILEI MATI[1] = "%dpnx1%", PATTERN=IJ:V, FIELDS=#1,2,3
  FILEI MATI[1] = "%dpnx1%", PATTERN=IJ:V, FIELDS=origin_taz,dest_taz,trips
  FILEO MATO[1]="%dpn1%-%@%.mat", MO=1 NAME=TRIPS

  PARAMETERS ZONES==%zones%
  MW[1]=MI.1.1
ENDRUN
