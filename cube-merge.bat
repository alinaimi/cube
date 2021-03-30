/*
set @=%~f0&call "%~dp0cube-p" %*
@set al_o=%~dpn1-merged-over-%~n2%~x1

VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::█████████████████�??*/ %add2script%

// print file="%dp1%workdir\%@%-%n1%%x1%-%dt%.log", list='1:\t%dpnx1% (overrides, higher priority)\n2:\t%dpnx2%\n\nout:\t%al_o%\n\n',' ','@al_o@',X(6.0)
;merge two .net  into _merged.net
run pgm=NETWORK PRNFILE="%PRNFILE%"

FILEI NETI[1]= "%dpnx1%"
FILEI NETI[2]= "%dpnx2%"

; same as method 1
;FILEI NODEI[1]= "%ali%"
FILEO NETO= "%al_o%"

endrun
