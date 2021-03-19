/*
set @=%~n0 &call "%~dp0cube-p" %*

@echo --- Extracting Headers in %nx1%
VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 1 &goto:EOF &::████████████████████████*/ %add2script%

;//!--- 1) extract headers
RUN PGM=NETWORK PRNFILE="%dp1%\workdir\%@%-%n1%%x1%-%dt%.PRN"

  FILEI LINKI[1] = "%dpnx1%"
  FILEO LINKO    = "%dp1%workdir\%n1%-hdr.csv", FORMAT=CS1, DELIMITER='\n' ; other formats: cs1, cs2, sdf, txt
  
  PHASE = LINKMERGE
      IF (A > -1)
          DELETE ;! keep headers only
      ENDIF
  ENDPHASE

ENDRUN
