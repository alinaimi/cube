/*
@call "%~dp0cube_p" %*&&@TITLE %~n0 (%*)&@echo -- %~n0 (%*)

@set al_o=%~dp2%~n1_merged_over_%~n2%~x1
VOYAGER "%~dp0%~nx0" %args%

@timeout 10 &goto:eof&::██████████████████████████████████████████████████████*/

print file="cube_merge.log", list='1:\t%al_1% (overrides, higher priority)\n2:\t%al_2%\n\nout:\t%al_o%\n\n',' ','@al_o@',X(6.0)
run pgm=NETWORK

FILEI NETI[1]= "%al_1%"
FILEI NETI[2]= "%al_2%"

FILEO NETO= "%al_o%"

endrun
