/*
set @=%~f0&call "%~dp0cube-p" %*

set zones=%n_zone%

%reset_rpt%
VOYAGER "%~dpnx0" %args%

@call "%~dp0cube-q" %* &goto:eof&::------------------------------*/ %add2script%

RUN PGM=FRATAR PRNFILE="%PRNFILE%"
// FILEI MATI[1] = "%f1%", PATTERN=IJ:V, FIELDS=origin_taz,dest_taz,trips
  MATI="%f1%"
  MATO="%dpn1%-bal.mat",MO=1
 
  // FileI LOOKUPI[1]= "%dp0%cube-mat-fratar-total.csv"
  FileI LOOKUPI[1]= "%dpn1%-total.csv"
  LOOKUP LOOKUPI=1, NAME=TOT,
    LOOKUP[1]=1,RESULT=2,
    LOOKUP[2]=1,RESULT=3

  MAXRMSE=0.1 MAXITERS=3
  // MAXRMSE=0.01 MAXITERS=10
  // MAXRMSE=0.00001 MAXITERS=100
  SETPA P[1]=TOT(1,J) A[1]=TOT(2,J) MW[1]=MI.1.1
  ACOMP=1,PCOMP=1
  MARGINS=1
ENDRUN
