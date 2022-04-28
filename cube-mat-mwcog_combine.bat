/*
set @=%~f0&call "%~dp0cube-p" %*

%reset_rpt%
VOYAGER "%~f0" %args%

@call "%~dp0cube-q" %* &goto:eof&::------------------------------*/%add2script%

:renumbering_mwcog;! Renumbering MWCOG
RUN PGM = MATRIX PRNFILE = "01MAT00A.PRN"
  Zones = 5996
  mati[5] = "%f1%"; xxaut.vtt
  mati[6] = "%dp1%xxcvt.vtt"
  mato[3] = "%dp1%MWCOG_Combined.MAT", MO = 31-34, NAME = Auto, CV, MTK, HTK

  FILLMW MW[5] = mi.5.1; COG - Auto
  FILLMW MW[6] = mi.6.1; COG - Commercial
  FILLMW MW[7] = mI.6.2; COG - Medium
  FILLMW MW[8] = mI.6.3; COG - Heavy

  LOOP ii = 1, 4
    mw[30 + ii] = mw[4 + ii] * 1
  ENDLOOP

  RENUMBER FILE = "%dp1%MWCOGToCombined_1.csv" MISSINGZI = w, MISSINGZO = w
ENDRUN
