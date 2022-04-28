/*
@set get_inf=2
set @=%~f0&call "%~dp0cube-p" %*
set mat1_size=%n_mat%
@rem @set names=%n1:-=_%
@rem @set names=%names%, %n2:-=_%&@set mo=2

::!*** extract years from file names
@set "str_n1=%~n1"
@set "str_n2=%~n2"
@set "str_split_first=%str_n1:20="  & set "str_split_last=%":: split by 20
@set "str_split_first2=%str_n2:20=" & set "str_split_last2=%":: split by 20

:: in case filename doesn't contain year, use dirname instead:
@set "str_n1=%~p1"
@set "str_n2=%~p2"
@if "%str_split_last%"=="" (
  @set "str_split_first=%str_n1:20="  & set "str_split_last=%":: split by 20
  @set "str_split_first2=%str_n2:20=" & set "str_split_last2=%":: split by 20
)

@set "yr1=%str_split_last:~0,2%"
@set "yr2=%str_split_last2:~0,2%"
@echo *** cagr "20%yr1%" to "20%yr2%"

%reset_rpt%
VOYAGER "%~f0" %args%

@call "%~dp0cube-q" %* &goto:eof&::------------------------------*/%add2script%
READ FILE = '%dp0%cube-cmt.bat'

RUN PGM=MATRIX PRNFILE="%PRNFILE%"
  MATI[1] = "%f1%"
  MATI[2] = "%f2%"
  MATO[1] = "%dpn1%-cagr-20%yr1%-to-20%yr2%.mat",
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

  jloop
    @cmt01@ if (MI.1.1[j] != 0)
    @cmt01@   CAGR = (MI.2.1[j] / MI.1.1[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt01@   MW[101][j] = CAGR
    @cmt01@ endif
    @cmt02@ if (MI.1.2[j] != 0)
    @cmt02@   CAGR = (MI.2.2[j] / MI.1.2[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt02@   MW[102][j] = CAGR
    @cmt02@ endif
    @cmt03@ if (MI.1.3[j] != 0)
    @cmt03@   CAGR = (MI.2.3[j] / MI.1.3[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt03@   MW[103][j] = CAGR
    @cmt03@ endif
    @cmt04@ if (MI.1.4[j] != 0)
    @cmt04@   CAGR = (MI.2.4[j] / MI.1.4[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt04@   MW[104][j] = CAGR
    @cmt04@ endif
    @cmt05@ if (MI.1.5[j] != 0)
    @cmt05@   CAGR = (MI.2.5[j] / MI.1.5[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt05@   MW[105][j] = CAGR
    @cmt05@ endif
    @cmt06@ if (MI.1.6[j] != 0)
    @cmt06@   CAGR = (MI.2.6[j] / MI.1.6[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt06@   MW[106][j] = CAGR
    @cmt06@ endif
    @cmt07@ if (MI.1.7[j] != 0)
    @cmt07@   CAGR = (MI.2.7[j] / MI.1.7[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt07@   MW[107][j] = CAGR
    @cmt07@ endif
    @cmt08@ if (MI.1.8[j] != 0)
    @cmt08@   CAGR = (MI.2.8[j] / MI.1.8[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt08@   MW[108][j] = CAGR
    @cmt08@ endif
    @cmt09@ if (MI.1.9[j] != 0)
    @cmt09@   CAGR = (MI.2.9[j] / MI.1.9[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt09@   MW[109][j] = CAGR
    @cmt09@ endif
    @cmt10@ if (MI.1.10[j] != 0)
    @cmt10@   CAGR = (MI.2.10[j] / MI.1.10[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt10@   MW[110][j] = CAGR
    @cmt10@ endif
    @cmt11@ if (MI.1.11[j] != 0)
    @cmt11@   CAGR = (MI.2.11[j] / MI.1.11[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt11@   MW[111][j] = CAGR
    @cmt11@ endif
    @cmt12@ if (MI.1.12[j] != 0)
    @cmt12@   CAGR = (MI.2.12[j] / MI.1.12[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt12@   MW[112][j] = CAGR
    @cmt12@ endif
    @cmt13@ if (MI.1.13[j] != 0)
    @cmt13@   CAGR = (MI.2.13[j] / MI.1.13[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt13@   MW[113][j] = CAGR
    @cmt13@ endif
    @cmt14@ if (MI.1.14[j] != 0)
    @cmt14@   CAGR = (MI.2.14[j] / MI.1.14[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt14@   MW[114][j] = CAGR
    @cmt14@ endif
    @cmt15@ if (MI.1.15[j] != 0)
    @cmt15@   CAGR = (MI.2.15[j] / MI.1.15[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt15@   MW[115][j] = CAGR
    @cmt15@ endif
    @cmt16@ if (MI.1.16[j] != 0)
    @cmt16@   CAGR = (MI.2.16[j] / MI.1.16[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt16@   MW[116][j] = CAGR
    @cmt16@ endif
    @cmt17@ if (MI.1.17[j] != 0)
    @cmt17@   CAGR = (MI.2.17[j] / MI.1.17[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt17@   MW[117][j] = CAGR
    @cmt17@ endif
    @cmt18@ if (MI.1.18[j] != 0)
    @cmt18@   CAGR = (MI.2.18[j] / MI.1.18[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt18@   MW[118][j] = CAGR
    @cmt18@ endif
    @cmt19@ if (MI.1.19[j] != 0)
    @cmt19@   CAGR = (MI.2.19[j] / MI.1.19[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt19@   MW[119][j] = CAGR
    @cmt19@ endif
    @cmt20@ if (MI.1.20[j] != 0)
    @cmt20@   CAGR = (MI.2.20[j] / MI.1.20[j]) ^ (1 / (%yr2% - %yr1%)) - 1;
    @cmt20@   MW[120][j] = CAGR
    @cmt20@ endif
  endjloop
ENDRUN
