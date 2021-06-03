/*
set @=%~f0&call "%~dp0cube-p" %*

set zones=%n_zone%

@set names=%n1:-=_%
@set names=%names%, %n2:-=_%&@set mo=2

%reset_rpt%
VOYAGER "%~f0" %args%

@call "%~dp0cube-q" %* &goto:eof&::------------------------------*/ %add2script%

nEE = 47
n1stExt = 3676 - 1

RUN PGM=MATRIX PRNFILE="%PRNFILE%"
  MATO[1]="%dpn1%-ee.mat", MO=1-6,DEC=S, NAME = SOV,HV2,HV3,CV,TRK,APV
  MATI[1]="%f1%", AUTOMDARRAY=MATI1 MI=1

  maxfields=@nEE@
  zones=@nEE@
  LOOP _J=1,ZONES
    // LOOP _k=1,ZONES
      // MW[1][_j] = MATI1[i][_j] + MATI2[i][_j]

      MW[1][_j] = matval(1,1,i + @n1stExt@,_j + @n1stExt@)
      MW[2][_j] = matval(1,2,i + @n1stExt@,_j + @n1stExt@)
      MW[3][_j] = matval(1,3,i + @n1stExt@,_j + @n1stExt@)
      MW[4][_j] = matval(1,4,i + @n1stExt@,_j + @n1stExt@)
      MW[5][_j] = matval(1,5,i + @n1stExt@,_j + @n1stExt@)
      MW[6][_j] = matval(1,6,i + @n1stExt@,_j + @n1stExt@)

    // ENDLOOP
  ENDLOOP

ENDRUN
