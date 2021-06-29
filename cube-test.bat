/*
set @=%~f0&call "%~dp0cube-p" %*

start VOYAGER "%~f0" %args%

@call "%~dp0cube-q" %*&goto:eof&::█████████████████*/%add2script%

cmt0 = ' '
if ( %argc% == 0 ) cmt0 = ';'

// print file="%dp1%workdir\%@_nam%-%n1%%x1%-%dt%.log", list='1:\t%f1% (overrides, higher priority)\n2:\t%f2%\n\nout:\t%al_o%\n\n',' ','@al_o@',X(6.0)

//!--- Misc1
RUN PGM=MATRIX
  FILEI MATI      = "%f1%"
  FILEO PRINTO[1] = out-vec.csv
  FILEO PRINTO[2] = out-mtx.csv
  
  @cmt0@ print LIST="ali"

  if ( I == 1 ) ; don't repeat for all zones/rows
  
    LOOP ii=1,2
      LOOP jj=1,3
        print csv=t form=8.0 list=ii, jj, ii*jj printo=1
      ENDLOOP
    ENDLOOP
    
    LOOP jj=1,4
      PRINT LIST='\\,', jj PRINTO=2 ; write the first J value in the first row
    ENDLOOP
    
    LOOP ii=5,9
      LOOP jj=1,4
      IF(jj==1) PRINT LIST=ii,' |' PRINTO=2 ; write the first J value in the first row
        PRINT LIST='\\,',ii*jj  PRINTO=2 ; add comma without chainge line
      ENDLOOP
    ENDLOOP
  
  ENDIF
ENDRUN

//!--- Misc2
RUN PGM=MATRIX PRNFILE = "%@_nam%-%n1%%x1%-%dt%.PRN"
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
    ' 3 30 300'  ; Income Class 3, Alpha, Beta
  
  ;LOOKUP NAME=TOT,LOOKUP[1]=1,RESULT=2,LOOKUP[2]=1,RESULT=3,
  ;1,2 = 20
  ;1,3 = 30
  ;2,3 = 300
  x=LOOKUP_fn(1,3)
  PRINT LIST="I", x
ENDRUN

//!--- Write to file
copy file=test.txt
test
endcopy
