/*
@set fn_tsv=%~dpn1-factor-set-ij.tsv
@if NOT exist "%fn_tsv%" (@echo ; fill this file 1st taz,factor>"%fn_tsv%" && @echo ;   -- Start of Int Ext-to-TAZ equivalency --,
1,1>>"%fn_tsv% && @echo 1,1>>"%fn_tsv%)
@set out=%~dpn1-factored-set.mat

@set get_inf=2
@set @=%~f0&call "%~dp0cube-p" %*
@set mat1_size=%n_mat%

%reset_rpt%
VOYAGER "%~f0" %args%

@call "%~dp0cube-q" %* &goto:eof&::------------------------------*/%add2script%
READ FILE = '%dp0%cube-cmt.bat'

RUN PGM=MATRIX PRNFILE="%PRNFILE%"
  FILEI DBI[1] = "%fn_tsv%",
    FIELDS = 1, 2,
    ;FIELDS = ij,
    DELIMITER[1] = ",",
    AUTOARRAY = ALLFIELDS
  MATI[1] = "%f1%"
  MATO[1] = "%out%",
    DEC  = %n_mat%*D,
    NAME = %n_name%,
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

  LOOP k = 2, DBI.1.NUMRECORDS
  ret_code = DBIReadRecord(1, k); // ret_code 0 is success
  m_ij   = DBI.1.NFIELD[1];
  factor = DBI.1.NFIELD[2];
  ;m_ij = DI.1.ij;
    jloop
      ;print list = i, j, m_ij, factor
      if ( i == m_ij || j == m_ij )
        ;print list = i, j, m_ij, factor, ' matched'
        @cmt01@ MW[101][j] = MI.1.01[j] * factor
        @cmt02@ MW[102][j] = MI.1.02[j] * factor
        @cmt03@ MW[103][j] = MI.1.03[j] * factor
        @cmt04@ MW[104][j] = MI.1.04[j] * factor
        @cmt05@ MW[105][j] = MI.1.05[j] * factor
        @cmt06@ MW[106][j] = MI.1.06[j] * factor
        @cmt07@ MW[107][j] = MI.1.07[j] * factor
        @cmt08@ MW[108][j] = MI.1.08[j] * factor
        @cmt09@ MW[109][j] = MI.1.09[j] * factor
        @cmt10@ MW[110][j] = MI.1.10[j] * factor
        @cmt11@ MW[111][j] = MI.1.11[j] * factor
        @cmt12@ MW[112][j] = MI.1.12[j] * factor
        @cmt13@ MW[113][j] = MI.1.13[j] * factor
        @cmt14@ MW[114][j] = MI.1.14[j] * factor
        @cmt15@ MW[115][j] = MI.1.15[j] * factor
        @cmt16@ MW[116][j] = MI.1.16[j] * factor
        @cmt17@ MW[117][j] = MI.1.17[j] * factor
        @cmt18@ MW[118][j] = MI.1.18[j] * factor
        @cmt19@ MW[119][j] = MI.1.19[j] * factor
        @cmt20@ MW[120][j] = MI.1.20[j] * factor
      endif
    endjloop
  ENDLOOP

ENDRUN
