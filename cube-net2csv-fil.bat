/*
set @=%~f0 &call "%~dp0cube-p" %*
@set headers=A,B,I324VOL,I424VOL

VOYAGER "%~dpnx0" %args%

::! add headers to 1st line
@echo %headers% > "%dpn1%-link.tmp"
@type "%dpn1%-link.csv" >> "%dpn1%-link.tmp"
@type "%dpn1%-link.tmp" > "%dpn1%-link.csv"
@del /a /f /q "%dpn1%-link.tmp"

@%SystemRoot%\System32\timeout 10 &goto:eof&::██████████████████████████████████████████████████████*/

RUN PGM=NETWORK
  FILEI LINKI[1]= "%dpnx1%"
  ,AUTOARRAY=ALLFIELDS

  PROCESS PHASE=LINKMERGE
  if (A==776.00 && B==27923) PRINT file="%dpn1%-link", List="%headers%"
  If (LI.1.FTYPE!=0 & LI.1.FTYPE!=2 & LI.1.FTYPE!=3 & LI.1.FTYPE!=4)
  ;If (LI.1.TMP > 0 || (LI.1.A==60907 & LI.1.B==60901) || (LI.1.A==113282 & LI.1.B==60901) || (LI.1.A==113282 & LI.1.B==60901) || (LI.1.A==60900 & LI.1.B==60908) || (LI.1.A==100069 & LI.1.B==35628) || (LI.1.A==100069 & LI.1.B==35629) || (LI.1.A==100068 & LI.1.B==100069) || (LI.1.A==60897 & LI.1.B==60898) || (LI.1.A==100066 & LI.1.B==100067)	|| (LI.1.A==60891 & LI.1.B==113269)	|| (LI.1.A==60891 & LI.1.B==22500)	|| (LI.1.A==113265 & LI.1.B==35011)	)
  PRINT CSV=T, FORM=10.2, List=%headers%, file="%dpn1%-link.csv"
  EndIf

;GEOMETRYSOURCE=1
;If (LI.1.A = LI.2.A & LI.1.B = LI.2.B)
;    TwoWayVol = round(LI.1.VEHS24 + LI.2.VEHS24)
;    AMlanes = (LI.1.amlane + LI.2.amlane)
;Else
;    TwoWayVol = round(LI.1.VEHS24)
;    AMlanes = LI.1.amlane
;EndIf
ENDPROCESS

ENDRUN
