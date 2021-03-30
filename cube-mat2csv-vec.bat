/*
set @=%~n0 &call "%~dp0cube-p" %*
set zones=3722
set mtx=2
@echo --- converting "%dpnx1%" to "csv"
@echo fast mat to csv vector converter in stupid format
@echo outputs vector: i / j / goto_tab{stupid: 1:next value is on tab 1 and so on} / cell_tab_1 / cell_tab_2...

start VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::████████████████████████████████████████████████*/ %add2script%

print file="%dp1%\workdir\%@%-%n1%%x1%-%dt%.log", list='1:\t%dpnx1% (overrides, higher priority)\n2:\t%dpnx2%\n\nout:\t\n\n',' ','@al_o@',X(6.0)
RUN PGM=MATRIX PRNFILE="%dp1%\workdir\%@%-%n1%%x1%-%dt%.PRN"

  FILEI MATI[1]="%dpnx1%"

  FILEO MATO[1] = "%dpn1%-%mtx%.dbf",
  MO=1, FORMAT = DBF, PATTERN = IJ:V

  ;FILEO MATO[2]="%dpn1%-%mtx%.csv" MO=1-3 FORMAT=CSV PATTERN=IJM:V MAXFIELDS=1
  FILEO MATO[2] = "%dpn1%-%mtx%.csv",
  MO=1, FORMAT = CSV, PATTERN = IJ:V MAXFIELDS=1 ;! MAXFIELDS breaks the columns, so 1 means vector format

  MW[1]=mi.1.%mtx% ;! need, otherwise thru F(693): There are no operations specified.
  ;FILLMW MW[1]=MI.1.1(3)

ENDRUN
