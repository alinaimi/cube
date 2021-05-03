/*
set @=%~f0&call "%~dp0cube-p" %*

set w=1240000
set e=1290000
set n=550000
set s=485000

%reset_rpt%

VOYAGER "%~dpnx0" %args%

@call "%~dp0cube-q" %*&goto:eof&::█████████████████�??*/ %add2script%

buf=10000

RUN PGM=NETWORK
  NETI = "%f1%"
  NETO = "%dpn1%-trimmed.net"

  if ( %w% > a.x || a.x > %e% ) DELETE; // li.yMid
  if ( %s% > a.y || a.y > %n% ) DELETE;

  phase=nodemerge
    ; if (n1.n==0) UNUSED=1 ; to flag unused nodes only
    if ( (%w% - @buf@) > n1.x || n1.x > (%e% + @buf@) ) DELETE;
    if ( (%s% - @buf@) > n1.y || n1.y > (%n% + @buf@) ) DELETE;
ENDRUN
