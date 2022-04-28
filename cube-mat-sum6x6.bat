/*
@set get_inf=2
set @=%~f0&call "%~dp0cube-p" %*
set mat1_size=%n_mat%
%reset_rpt%
@set out=%~dpn1%-sum6x6.mat
VOYAGER "%~f0" %args%
@call "%~dp0cube-q" %* &goto:eof&::------------------------------*/%add2script%

READ FILE = '%dp0%cube-cmt.bat'
;CATALOG_DIR=%dp1%..

:sum6x6
RUN PGM = MATRIX PRNFILE = "%out%-%dt%.prn"; "%PRNFILE%";
  ;! Decalring variables
  MATI[1] = "%f1%"
  MATO[1] = "%out%",
    NAME = %n_name%,
    // DEC=20*8,
	@ucmt01@ MO = 101 - 101
    @ucmt02@ MO = 101 - 102
    @ucmt03@ MO = 101 - 103
    @ucmt04@ MO = 101 - 104
    @ucmt05@ MO = 101 - 105
    @ucmt06@ MO = 101 - 106
    @ucmt07@ MO = 101 - 107
    @ucmt08@ MO = 101 - 108
    @ucmt09@ MO = 101 - 109
    @ucmt10@ MO = 101 - 110
    @ucmt11@ MO = 101 - 111
    @ucmt12@ MO = 101 - 112
    @ucmt13@ MO = 101 - 113
    @ucmt14@ MO = 101 - 114
    @ucmt15@ MO = 101 - 115
    @ucmt16@ MO = 101 - 116
    @ucmt17@ MO = 101 - 117
    @ucmt18@ MO = 101 - 118
    @ucmt19@ MO = 101 - 119
    @ucmt20@ MO = 101 - 120
  Zones = 5996

  ;! Filling up the target matrices
  @cmt01@ MW[101] = MI.1.01
  @cmt02@ MW[102] = MI.1.02
  @cmt03@ MW[103] = MI.1.03
  @cmt04@ MW[104] = MI.1.04
  @cmt05@ MW[105] = MI.1.05
  @cmt06@ MW[106] = MI.1.06
  @cmt07@ MW[107] = MI.1.07
  @cmt08@ MW[108] = MI.1.08
  @cmt09@ MW[109] = MI.1.09
  @cmt10@ MW[110] = MI.1.10
  @cmt11@ MW[111] = MI.1.11
  @cmt12@ MW[112] = MI.1.12
  @cmt13@ MW[113] = MI.1.13
  @cmt14@ MW[114] = MI.1.14
  @cmt15@ MW[115] = MI.1.15
  @cmt16@ MW[116] = MI.1.16
  @cmt17@ MW[117] = MI.1.17
  @cmt18@ MW[118] = MI.1.18
  @cmt19@ MW[119] = MI.1.19
  @cmt20@ MW[120] = MI.1.20
  
  RENUMBER, FILE = "%dp1%..\input\renumber-sum6x6.csv"
ENDRUN
