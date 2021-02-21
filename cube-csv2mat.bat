/*
set @=%~n0 &call "%~dp0cube-p" %*
@set al_o=%~dpn1-csv2mat%~n2%~x1

set zones=3722
VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::------------------------------------------------------------------------*/

print file="%dp1%\workdir\%@%-%n1%%x1%-%dt%.log", list='1:\t%dpnx1% (overrides, higher priority)\n2:\t%dpnx2%\n\nout:\t%al_o%\n\n',' ','@al_o@',X(6.0)
RUN PGM=MATRIX PRNFILE="%dp1%\workdir\%@%-%n1%%x1%-%dt%.PRN"

FILEI MATI="%dpnx1%"  PATTERN=IJ:V  FIELDS=#1-{zones}
FILEO MATO="%al_o%", mo=1, DEC=6
PAR  ZONES=%zones%
mw[1]=mi.1.1

ENDRUN
