/*
set @=%~n0 &call "%~dp0cube-p" %*
@set al_o=%~dpn1.csv

VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::██████████████████████████████████████████████████████*/

RUN PGM=MATRIX PRNFILE="%dp1%\workdir\%@%-%n1%%x1%-%dt%.PRN"

FILEI MATI[1] = "%dpnx1%"
;MO=1-48
FILEO MATO[1] = "%~dpn1-.dbf",
MO=1, FORMAT  = DBF, PATTERN = IJM:V

FILEO MATO[2] = "%al_o%",
MO=1, FORMAT  = CSV, PATTERN = IJM:V
;, MAXFIELDS  = 48 FIELDS = 25-26,1-3722,1-48,0

MW[1] = mi.1.1

ENDRUN
