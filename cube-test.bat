/*
set @=%~f0&call "%~dp0cube-p" %*

start VOYAGER "%~f0" %args%

@call "%~dp0cube-q" %*&goto:eof&::█████████████████*/%add2script%

// print file="%dp1%workdir\%@_nam%-%n1%%x1%-%dt%.log", list='1:\t%f1% (overrides, higher priority)\n2:\t%f2%\n\nout:\t%al_o%\n\n',' ','@al_o@',X(6.0)
RUN PGM=MATRIX
  FILEI MATI      = "%f1%"
  FILEO PRINTO[1] = out_vec.csv
  FILEO PRINTO[2] = out_mtx.csv
  
  IF(I==1) ; don't repeat for all zones/rows
  
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

copy file=test.txt
test
endcopy
