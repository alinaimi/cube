/*
set @=%~n0 &call "%~dp0cube-p" %*
@echo convert mdb/dbf to csv

VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::*************************************************************************/

RUN PGM=MATRIX

PAR MAXSTRING=32000 ;Here's why this won't work for too many records/very long strings.
FILEI DBI[1] = "%dpnx1%"
ZONES=1

_TEXTVALLIST='' ;This will be a list of the TEXTFIELD values with corresponding OTHERFIELD values from DBI[2]
LOOP _N=1,DBI.1.NUMRECORDS,1
_X=DBIREADRECORD(1,_N)
_TEXTVALLIST = _TEXTVALLIST;+TRIM(DI.1.TEXTFIELD)+' '+STR(DI.1.OTHERFIELD,2,0)+','
ENDLOOP ;Here's the construction of the list

PRINT LIST=_TEXTVALLIST ;Just here to look at the list in the PRN file

ENDRUN
