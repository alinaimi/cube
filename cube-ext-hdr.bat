/*
set @=%~f0&call "%~dp0cube-p" %*

@echo --- Extracting Headers in %nx1%
VOYAGER "%~dpnx0" %args%

@call "%~dp0cube-q" %* &goto:EOF &::█████████████████�??*/ %add2script%

;//!--- 1) extract headers
RUN PGM=NETWORK PRNFILE="%PRNFILE%"
  FILEI LINKI[1] = "%f1%"
  FILEO LINKO    = "%dp1%workdir\%n1%-hdr.csv", FORMAT=CS1, DELIMITER='\n' ; other formats: cs1, cs2, sdf, txt
  
  PHASE = LINKMERGE
    IF (A > -1) DELETE ;! keep headers only
  ENDPHASE
ENDRUN
