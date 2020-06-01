/*
@call "%~dp0cube_p" %*&&@TITLE %~n0 (%*)&@echo -- %~n0 (%*)

@set al_o=%~dp1%~n1.net

VOYAGER "%~dp0%~nx0" %args%
@rem TPPLUS "%~dp0%~nx0" /Command /CloseWhenDone /Minimize /NoSplash /Start -Sworkdir "%~dp1"
@REM RUNTPP VOYAGER "%~dp0%~nx0" -PH:32767 -PW:255 /Command /CloseWhenDone /Minimize /NoSplash /Start -Sworkdir "%~dp1"

@timeout 10 &goto:eof&::██████████████████████████████████████████████████████*/

;print file="%al_o_link%.log", list='%al_1%',' ','@ali@',X(6.0)
RUN PGM=NETWORK
;RUN PGM=NETWORK PRNFILE='..\%scenario%\outputs\NETOUT.PRN' MSG='Convert to NET for efficiency'

FILEI LINKI[1]= "%al_1%"

FILEI LINKI[1] = "%al_1%"
FILEO NETO = "%al_o%",
;EXCLUDE =  OBJECTID, Shape, A, B, A1, B1, Flag

ENDRUN
