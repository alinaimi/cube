/*
set @=%~n0 &call "%~dp0cube-p" %*
set zones=3722
set zones=5996

:: todo: get table names automatically from MATI, use loop
::FOR /L %%I IN (1,1,10) DO (
set mtx=%%I

set mtx=1
set tbname=SOV
@echo --- THIS SCRIPT READS A MAT FILE ("%dpnx1%"), CREATE TWO MATRICS IN CSV AND DBF ("%dpn1%-%mtx%.csv")
start VOYAGER "%~dpnx0" %args%

set mtx=2
set tbname=HV2
start VOYAGER "%~dpnx0" %args%

set mtx=3
set tbname=HV3
start VOYAGER "%~dpnx0" %args%

set mtx=4
set tbname=CV
start VOYAGER "%~dpnx0" %args%

set mtx=5
set tbname=TRK
start VOYAGER "%~dpnx0" %args%

set mtx=6
set tbname=APV
start VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::██████████████████████████████████████████████████████*/

;print file="%dp1%\workdir\%@%-%n1%%x1%-%dt%.log", list='1:\t%dpnx1% (overrides, higher priority)\n2:\t%dpnx2%\n\nout:\t%dpn1%-%mtx%.csv\n\n',' ',X(6.0)
RUN PGM=MATRIX PRNFILE="%dp1%\workdir\%@%-%n1%%x1%-%dt%.PRN" MSG='Convert MAT back to Original CSV Format'

tbname=str(%mtx%,2,0)
IF (%mtx%==1) tbname='SOV'

FILEI MATI[1] = "%dpnx1%"
;FILEI MATI="%dpnx1%" PATTERN=IJ:V FIELDS=#1-%zones%
PAR  ZONES=%zones%

;FILEO MATO[1] = "%dpn1%-%mtx%.dbf",
;MO=1, FORMAT = DBF, PATTERN = IJ:V
;FILEO MATO[2] = "%dpn1%-%mtx%.csv",
;MO=1, FORMAT = CSV, PATTERN = IJ:V MAXFIELDS=1
;MW[1]=mi.1.1 ;! need, otherwise thru F(693): There are no operations specified.

FILEO MATO[1] = "%dpn1%-%mtx%-%tbname%.dbf",
MO=1, FORMAT=DBF, PATTERN=IJ:V

;oo='%dpn1%-%mtx%-vec.csv'
;FILEO MATO[2] = %oo%,
FILEO MATO[2] ='%dpn1%-%mtx%-%tbname%-vec.csv',
MO=1, FORMAT = CSV, PATTERN = IJ:V MAXFIELDS=1

;!--- log
;PRINT 'allll'
;FILEO PRINTO[3] = "3.csv_"
;PRINT PRINTO=3 'allll12'
;print file="ali.log", list='aa',CHECKNAME(MI.1.SOV_TOLL),MI.1.SOV_TOLL
;print file="ali.log", list='aa',mi[1],mi.1.name,MI.1.1.matnum,MI.1.name.T,CHECKNAME('MI.1.SOV_TOLL'),CHECKNAME(MI.1.SOV_TOLL),MI.1.SOV_TOLL
;print file="ali-%mtx%.log", list=%mtx%(1),tbname,MI.1.6 ;MI.1.name(2),GetMatrixRow('MI.1.1',2,1),MW[1].name; MI.n.matnum MI.n.name.T MI.n.matnum.T


MW[1]=mi.1.1 ;! MI.1.2 means MI.{file MATI[1]}.{table 2}

;MW[2]=mi.1.2

;    IF(I=1)
;        JLOOP
;           IF(J=1) 
;              PRINT LIST=' ,', J(10.0L) PRINTO=1 ; write the first J value in the first row
;           ELSE
;              PRINT LIST='\\', J(10.0L) PRINTO=1 ; write J value without changine line
;           ENDIF
;           IF(J<ZONES) PRINT LIST='\\,' PRINTO=1 ; write comma without chainge line
;        ENDJLOOP
;    ENDIF

;!--- 2nd method
FILEO PRINTO[1] = "%dpn1%-%mtx%-%tbname%-mtx.csv"
    JLOOP
      IF (j=1) PRINT PRINTO=1 LIST=i(10.1L),','
      ;PRINT PRINTO=1 LIST='\\',MI.1.1(10.1L)    ; write value without changing line
      PRINT PRINTO=1 LIST='\\',MI.1.%mtx%(10.1L) ; write value without changing line
	  ;PRINT PRINTO=1 LIST='\',MW1
      IF(J<ZONES) PRINT PRINTO=1 LIST='\\,'      ; write comma without changing line
    ENDJLOOP

ENDRUN
