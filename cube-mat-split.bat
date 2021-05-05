/*
set @=%~f0&call "%~dp0cube-p" %*

set zones=%n_zone%

%reset_rpt%
VOYAGER "%~dpnx0" %args%

@call "%~dp0cube-q" %* &goto:eof&::------------------------------*/ %add2script%

RUN PGM=MATRIX PRNFILE="%PRNFILE%"
  MATI="%f1%"

  MATO[1]="%dpn1%-1.mat",MO=1
  MATO[2]="%dpn1%-2.mat",MO=2
  MATO[3]="%dpn1%-3.mat",MO=3

  MW[1]=MI.1.1
  MW[2]=MI.1.2
  MW[3]=MI.1.3
ENDRUN
