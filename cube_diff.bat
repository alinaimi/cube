/*
@call "%~dp0cube_p" %*&&@TITLE %~n0 (%*)&@echo -- %~n0 (%*)

@set     al_o=%~dp2%~n1_diff_%~n2%~x1
@set al_o_vol=%~dp2%~n1_diff_vol_%~n2%~x1

VOYAGER "%~dpnx0"             %args%
VOYAGER "%~dp0cube_diff_vol.bat" %args%

@timeout 10 &goto:eof&::██████████████████████████████████████████████████████*/

print file="cube_diff.log", list='1:\t%al_1%\n2:\t%al_2%\n\nout:\t%al_o%\n\n',' ','@ali@',X(6.0)

;>>>
;>>> 
;>>> 
;Input  Highway Network File 1: a
;Input  Highway Network File 2: b
;Output Highway Network File:   c
;;<<End Parameters>>;;

RUN PGM=NETWORK
; Compare 2 highway networks and flags the links that are different

FILEI NETI[1] = "%al_1%"
FILEI NETI[2] = "%al_2%"
FILEO NETO    = "%al_o%"

  MERGE RECORD=T 
  PHASE=LINKMERGE
    COMPARE RECORD=1-2, LIST=20  ; compare link record 1 with 2
    CMPFLAG=_COMPARE             ; save comparison flag
                                 ; -2 = link in NET1, not in NET2 
                                 ; -1 = link in NET2, not in NET1    
                                 ;  0 = links identical
                                 ; +n = number of attributes that are different

ENDRUN
