/*
set @=%~f0&call "%~dp0cube-p" %*

VOYAGER "%~f0" %args%

@call "%~dp0cube-q" %* &goto:eof&::-------------------------------*/%add2script%

; CSV DNW easily/or at all, so convert them into dbf
RUN PGM=MATRIX
  ZONES = 1
  FILEI DBI[1] = "%f1%", AUTOARRAY=ALLFIELDS
  FILEO RECO   = "%dpn1%-BSEARCH.dbf", FIELDS = taz(8.0), sum_i, sum_j

  BSEARCH DBA.1.taz = 2    ; search area name by string value
  RO.taz = _BSEARCH        ; output area type
  WRITE RECO=1
  print list = '_BSEARCH:', _BSEARCH, DBA.1.taz[_BSEARCH], DBA.1.sum_i[_BSEARCH], DBA.1.sum_j[_BSEARCH];
ENDRUN
