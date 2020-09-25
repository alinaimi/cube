/*
@call "%~dp0cube_p" %*&&@TITLE %~n0 (%*)&@echo -- %~n0 (%*)

@set     al_o=%~dp2%~n1_diff_%~n2%~x1
@set al_o_vol=%~dp2%~n1_diff_vol_%~n2%~x1

VOYAGER "%~dpnx0" %args%

@timeout 10 &goto:eof&::██████████████████████████████████████████████████████*/

print file="cube_diff.log", list='1:\t%al_1%\n2:\t%al_2%\n\nout:\t%al_o_vol%\n\n',' ','@ali@',X(6.0)
;>>>
;>>> 
;Input  Highway Network File 1: a
;Input  Highway Network File 2: b
;Output Highway Network File:   d
;;<<End Parameters>>;;
RUN PGM=NETWORK
FILEI NETI[1] = "%al_1%"
FILEI NETI[2] = "%al_2%"
FILEO NETO = "%al_o_vol%",
     INCLUDE=A B LOAD1 LOAD2 LOADCHG ABSLOADCHG PRCLOADCHG, 
            CSPD1 CSPD2 CSPDCHG ABSCSPDCHG PRCCSPDCHG,
            TIME1 TIME2 TIMECHG ABSTIMECHG PRCTIMECHG,
            VC1 VC2 VCCHG ABSVCCHG PRCVCCHG

   LOAD1=LI.1.V_1
   LOAD2=LI.2.V_1  
  
   LOADCHG=(LOAD2 - LOAD1)
   ABSLOADCHG=ABS(LOAD2-LOAD1)
if (load1>0) PRCLOADCHG=LOADCHG/LOAD1
   CSPD1=LI.1.CSPD_1
   CSPD2=LI.2.CSPD_1
   CSPDCHG=(CSPD1-CSPD2)
   ABSCSPDCHG=ABS(CSPD1-CSPD2)
if (CSPD1>0) PRCCSPDCHG=CSPDCHG/CSPD1
   TIME1=LI.1.TIME_1
   TIME2=LI.2.TIME_1
   TIMECHG=(TIME1-TIME2)
   ABSTIMECHG=ABS(TIME1-TIME2)
if (TIME1>0) PRCTIMECHG=TIMECHG/TIME1
   VC1=LI.1.VC_1
   VC2=LI.2.VC_1
   VCCHG=(VC1-VC2)
   ABSVCCHG=ABS(VC1-VC2)
if (VC1>0) PRCVCCHG=VCCHG/VC1

ENDRUN
