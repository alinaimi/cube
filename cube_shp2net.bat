/*
@call "%~dp0cube_p" %*&&@TITLE %~n0 (%*)&@echo -- %~n0 (%*)

@set al_o=%~dpn1.net

VOYAGER "%~dpnx0" %args%
@rem TPPLUS "%~dpnx0" /Command /CloseWhenDone /Minimize /NoSplash /Start -Sworkdir "%~dp1"
@REM RUNTPP VOYAGER "%~dpnx0" -PH:32767 -PW:255 /Command /CloseWhenDone /Minimize /NoSplash /Start -Sworkdir "%~dp1"

@timeout 10 &goto:eof&::██████████████████████████████████████████████████████*/

;print file="%al_o_link%.log", list='%al_1%',' ','@ali@',X(6.0)
RUN PGM=NETWORK

FILEI LINKI[1]= "%al_1%"

FILEI LINKI[1] = "%al_1%"
FILEO NETO = "%al_o%",

ENDRUN
