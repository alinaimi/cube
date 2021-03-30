/*
set @=%~f0&call "%~dp0cube-p" %*

set zones=3722
VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::------------------------------------------------------------------------*/

sum=0

// vector to mat
Run pgm=MATRIX PRNFILE="%PRNFILE%"
  FILEI MATI[1] = "%dpnx1%", PATTERN=IJ:V FIELDS=#1,2,3
  //FILEI MATI[1] = "%dpnx1%", PATTERN=IJ:V, FIELDS=#1,0,2-4, SKIPRECS =1
  FILEO MATO[1]="%dpn1%-%@%.mat", mo=1, DEC=2 ;// , MO=1 NAME=TRIPS , mo=1, DEC=2
  PAR  ZONES=%zones%
  ZONES=%zones%

  mw[1]=mi.1.1
  //sum=sum+mi.1.1
EndRun

// matrix to mat
Run pgm=MATRIX MSG='Convert CSV in matrix format into .MAT'
  FILEI MATI[1] = "%dpnx1%", PATTERN=IJ:V, FIELDS=#1,0,2-4, SKIPRECS =1
  FILEO MATO[1] = "%dpn1%-%@%-2d.mat", MO=1

  ZONES=%zones%
  MW[1]=MI.1.1
EndRun
