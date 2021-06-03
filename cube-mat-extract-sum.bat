/*
set @=%~f0&call "%~dp0cube-p" %*

set zones=%n_zone%

@set names=%n1:-=_%
@set names=%names%, %n2:-=_%&@set mo=2

@rem @set mati3=
@rem @if NOT [%n3%]==[] @(@set names=%names%, %n3:-=_%&@set mo=3&@set mati3=MATI[3]="!f3!")

%reset_rpt%
VOYAGER "%~f0" %args%

@call "%~dp0cube-q" %* &goto:eof&::------------------------------*/ %add2script%

// IF (isEnabled = 1)
//   comment = ' '
// ELSEIF (isEnabled = 2)
//   comment = ';'
// ELSE
//   comment = ';'
// ENDIF

RUN PGM=MATRIX PRNFILE="%PRNFILE%"
  MATO[1]="%dpn1%-sum.mat", MO=1-6,DEC=S, NAME = SOV,HV2,HV3,CV,TRK,APV

  MW[1] = MI.1.1 + MI.2.1 + MI.3.1 + MI.4.1
  MW[2] = MI.1.2 + MI.2.2 + MI.3.2 + MI.4.2
  MW[3] = MI.1.3 + MI.2.3 + MI.3.3 + MI.4.3
  MW[4] = MI.1.4 + MI.2.4 + MI.3.4 + MI.4.4
  MW[5] = MI.1.5 + MI.2.5 + MI.3.5 + MI.4.5
  MW[6] = MI.1.6 + MI.2.6 + MI.3.6 + MI.4.6

  // @comment@var_x = blahblah
  // @mati3@
  // // if ( STRLEN('%f3%') > 4 ) PRINT LIST=1
  // if ( STRLEN('%f3%') != 4 )
  //   MATI[3]="%f3%"
  //   MW[3]=MI.3.1
  // endif
ENDRUN
