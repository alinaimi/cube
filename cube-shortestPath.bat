/*
set @=%~f0 &call "%~dp0cube-p" %*

@echo --- shortest Path %nx1%

::!--- set orig / dest
@set Orig=99180  &:: GP E
@set dest=108617,28135,45723,113333,99180,60861,23604
@echo 2%2 3%3
@if not [%2]==[] set Orig=%2
@if not [%3]==[] set dest=%3
@echo Orig%Orig%
@pause

::! Cube.exe has issues w/ these types of env. variables usages, so use a temporary intermediate file
@set tmp="%~dp1workdir\%~n0-tmp%~x0"
@DEL %tmp%
@setLocal EnableDelayedExpansion
@For /f "tokens=* delims= " %%a in (%~dpnx0) do @(
  @Set str=%%a
  @set str=!str:@orig@=%orig%!
  @set str=!str:@dest@=%dest%!
  @set str=!str:@n1@=%n1%!
  @set str=!str:@dp1@=%dp1%!
  @set str=!str:@dpnx1@=%dpnx1%!
  @echo !str!>>%tmp%
)
@ENDLOCAL

::! Exec
Cube %tmp% /Command /CloseWhenDone /Minimize /NoSplash

::! Add headers
@echo o,d,d_,I4AMTIME,DISTANCE > "%dp1%workdir\%n1%-ShortestPaths.csv.hdr"
@copy "%dp1%workdir\%n1%-ShortestPaths.csv.hdr"+"%dp1%workdir\%n1%-ShortestPaths.csv" "%dp1%%n1%-ShortestPaths_o-%Orig%.csv"

@%SystemRoot%\System32\timeout 15 &goto:EOF &::██████████████████████████████████████████████████████*/

FUNCTION = BUILDPATH
  neti="@dpnx1@"
  pathprinto="@dp1@\workdir\@n1@_ShortestPaths.csv"
  CostSpec="I4AMTIME" ;impedance
  fileformat=txt
  ;fileformat= dbf
  ;fileformat= csv
  MaxPathCost = 4800
  PRINTMODE=SUMMARY

  ;!--- origin to each destination specified
  Origin=@orig@
  Destination=@dest@

  close
endfunction
