/*
set @=%~f0&call "%~dp0cube-p" %*

set ali_trn_mod=AB

@rem VOYAGER "%~dpnx0" %args%
TPPLUS "%~dpnx0" %args%

@if errorlevel 2 (@echo Error in Transit Skim %ali_trn_mod% &pause)

@%SystemRoot%\System32\timeout.exe 10 &EXIT 0&goto:eof&::--------*/ %add2script%

RUN PGM=TRNBUILD
 NETI = "%dpnx1%"; ZONEHWY.NET
 MATO = "%dpn1%.skm";
 maxnode = 999999

 HWYTIME = @TIME_PERIOD@HTIME

ZONEACCESS  GENERATE=N
fileo supporto = "%dp1%supl.asc" modes=11-16 oneway=t fixed=y
fileo nodeo    = "%dp1%supn.dbf"
fileo linko    = "%dp1%trnl.dbf"
READ FILE = "%dp1%new_bus.tb"
READ FILE = "%dp1%walkacc.asc"
ENDRUN
