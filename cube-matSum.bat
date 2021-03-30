/*
set @=%~n0 &call "%~dp0cube-p" %*
set mtx=2
set mat1_size=13
set mat2_size=2

@set two_files=0
@if [%~x2]==[.mat] (@set two_files=1)
@if [%~x2]==[.skm] (@set two_files=1)
@if %two_files%==0 (@set n2=_)

@echo --- summarizing 1: "%nx1%", and 2: "%nx2%", two_files=%two_files%

start VOYAGER "%~dpnx0" %args%

set s1=0
@%SystemRoot%\System32\timeout 10 &goto:eof&::████████████████████████████*/ %add2script%

RUN PGM=MATRIX PRNFILE="%PRNFILE%"

  FILEI MATI[1]="%dpnx1%"
  ;IF(%two_files%==1)
  ;  FILEI MATI[2]="%dpnx2%"
  ;ELSE
  ;  FILEI MATI[2]="%dpnx1%"
  ;ENDIF
  lenght_filter=1

  mat1_size=%mat1_size%
  mat2_size=%mat2_size%

  ;FILEO MATO[1] = "%dpn1%-%mtx%.dbf",
  ;MO=1, FORMAT = DBF, PATTERN = IJ:V

  ;FILEO MATO[2] = "%dpn1%-%mtx%-s.csv",
  ;MO=1, FORMAT = CSV, PATTERN = IJ:V ; MAXFIELDS=1 ;! MAXFIELDS breaks the columns, so 1 means vector format

  ;  IF(%two_files%==1)
  ;   fn = '%dpn1%-%n2%-sum.csv'
  ;  ELSE
  ;   fn= '%dpn1%-sum.csv'
  ;  ENDIF

  FILEO PRINTO[1] = "%dpn1%-sum.csv"
  ARRAY sums1 = %mat1_size%

LOOP ii = 1, mat1_size, 1 ; Begin, End, Incr
  Jloop
    ;IF(CHECKNAME('LI.1.LANES')>0)
    ;PRINT LIST="I", I(0), " J", J(0), " - ", %two_files%, mat1_size(0);, mi.1.numrecords, MATRIX.TOT; MATVAL(1, 3, 1, 1, -2)=='?' ; Slow
    ;if ("%n2%"=="%%n2%%") print file="%dp1%\aa.log", list='1:\t%dpnx1% - %dpnx2%'
    ;sums1[ii] = sums1[ii] + mi.1[ii]
    sums1[ii] = sums1[ii] + MATVAL(1, ii, I, J)
  endjloop
ENDLOOP

IF(i=zones)
  PRINT PRINTO=1 LIST="--- Sum Mat (%parent1%\%n1%%x1%)"
  LOOP ii = 1, mat1_size, 1
    PRINT PRINTO=1 LIST="\nsum ", ii(0), ' = ', sums1[ii]
  ENDLOOP
ENDIF

ENDRUN
