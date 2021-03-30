/*
set @=%~f0&call "%~dp0cube-p" %*
set dis_veh_end=6 &::mtx_dis_veh
set trp_fac_beg=8 &set trp_fac_end=8 &::mtx_trp_fac
set max_cat=50

@echo --- summarizing: &@echo trip mat1: "%nx1%" &@echo dist mat2: "%nx2%"

start VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::████████*/ %add2script%

RUN PGM=MATRIX PRNFILE = "%@%-%n1%%x1%-%dt%.PRN"
  zones=1
  ;!======================MISC FUNCTION========================
  PRINT LIST="round(0.5)", round(0.5)
  PRINT LIST="RAND()", rand()
  PRINT LIST="RANDOM(1000.5)", RANDOM(1000.5)
  
  PRINT LIST="int(0.4)", int(0.4)
  PRINT LIST="int(0.5)", int(0.5)
  PRINT LIST="int(0.999999999)", int(0.999999999)
  PRINT LIST="round(0.4)", round(0.4)
  PRINT LIST="round(0.5)", round(0.5)

  ;!======================LOOKUP FUNCTION======================
  LOOKUP NAME=LOOKUP_fn,; Gamma Function Parameters
  LOOKUP[1]=1, RESULT=2, ; ALPHA VALUE
  LOOKUP[2]=1, RESULT=3, ; BETA VALUE
  INTERPOLATE=N, ; No Interpolation needed on income class
  R=' 1 10 100', ; Income Class 1, Alpha, Beta
    ' 2 20 200', ; Income Class 2, Alpha, Beta
    ' 3 30 300' ; Income Class 3, Alpha, Beta
  
  ;LOOKUP NAME=TOT,LOOKUP[1]=1,RESULT=2,LOOKUP[2]=1,RESULT=3,
  ;1,2 = 20
  ;1,3 = 30
  ;2,3 = 300
  x=LOOKUP_fn(1,3)
  PRINT LIST="I", x
ENDRUN
