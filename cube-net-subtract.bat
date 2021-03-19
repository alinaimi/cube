/*
@set @=%~n0&@call "%~dp0cube-p" %*
set mtx=2
@echo --- xxx "%dpnx1%"

@set fn=%~nx1
set itr=%fn:~0,2%
set _iter_=%itr%
set scenar=2019
set scenar=2019_Base

start VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::█████████████████████████████████*/ %add2script%

itr='%itr%'
print file="%dp1%\workdir\%@%-%n1%%x1%-%dt%.log", list='1:\t%dpnx1% (overrides, higher priority)\n2:\t%dpnx2%\n\nout:\t\n\n',' ','@al_o@',X(6.0)

run pgm=network
  neti = "%dpnx1%" , "%dpnx2%"
  neto = "%n1%-subtract-%n2%.net"

  st_I4AMSOV = li.2.I4AMSOV - li.1.I4AMSOV
  st_I424VOL = li.2.I424VOL - li.1.I424VOL

  st_I4AMSOV = li.2.I4AMSOV - li.1.I4AMSOV
  st_I4AMHV2 = li.2.I4AMHV2 - li.1.I4AMHV2
  st_I4AMHV3 = li.2.I4AMHV3 - li.1.I4AMHV3
  st_I4AMCV  = li.2.I4AMCV  - li.1.I4AMCV
  st_I4AMTRK = li.2.I4AMTRK - li.1.I4AMTRK
  st_I4AMAPX = li.2.I4AMAPX - li.1.I4AMAPX
  st_I4AMVOL = li.2.I4AMVOL - li.1.I4AMVOL
  st_I4AMVMT = li.2.I4AMVMT - li.1.I4AMVMT

  st_I4PMSOV = li.2.I4PMSOV - li.1.I4PMSOV
  st_I4PMHV2 = li.2.I4PMHV2 - li.1.I4PMHV2
  st_I4PMHV3 = li.2.I4PMHV3 - li.1.I4PMHV3
  st_I4PMCV  = li.2.I4PMCV  - li.1.I4PMCV
  st_I4PMTRK = li.2.I4PMTRK - li.1.I4PMTRK
  st_I4PMAPX = li.2.I4PMAPX - li.1.I4PMAPX
  st_I4PMVOL = li.2.I4PMVOL - li.1.I4PMVOL
  st_I4PMVMT = li.2.I4PMVMT - li.1.I4PMVMT

endrun
