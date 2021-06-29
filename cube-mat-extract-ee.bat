/*
@set get_inf=2
set @=%~f0&call "%~dp0cube-p" %*

set mat1_size=%n_mat%

set mat1_size=%n_mat%

%reset_rpt%
VOYAGER "%~f0" %args%

@call "%~dp0cube-q" %* &goto:eof&::------------------------------*/%add2script%

READ FILE = '%dp0%cube-cmt.bat'

//! MWCOG
nLastInt = 3675; // 1stExt_3676 - 1
nLastExt = 3722; // nLastExt - nLastInt;// 47

//! Fampo
// nLastInt = 961
// nLastExt = 1002

//! RTC
// nLastInt = 1379
// nLastExt = 1430

nEE      = nLastExt - nLastInt;

RUN PGM=MATRIX PRNFILE="%PRNFILE%"
  MATI[1] = "%f1%",
    AUTOMDARRAY=MATI1 MI=1
  // MATO[1]="%dpn1%-joined-sum.mat",MO=1-%mo%, DEC=20*8, NAME = %names%
  FILEO PRINTO[1] = "%dpn1%-ee-Original_zone_numbers.csv"
          MATO[1] = "%dpn1%-ee.mat",
    //  MO=1-6, DEC=S, NAME = SOV,HV2,HV3,CV,TRK,APV
    @ucmt01@ MO=101-101
    @ucmt02@ MO=101-102
    @ucmt03@ MO=101-103
    @ucmt04@ MO=101-104
    @ucmt05@ MO=101-105
    @ucmt06@ MO=101-106
    @ucmt07@ MO=101-107
    @ucmt08@ MO=101-108
    @ucmt09@ MO=101-109
    @ucmt10@ MO=101-110
    @ucmt11@ MO=101-111
    @ucmt12@ MO=101-112
    @ucmt13@ MO=101-113
    @ucmt14@ MO=101-114
    @ucmt15@ MO=101-115
    @ucmt16@ MO=101-116
    @ucmt17@ MO=101-117
    @ucmt18@ MO=101-118
    @ucmt19@ MO=101-119
    @ucmt20@ MO=101-120

  maxfields=@nEE@
  zones=@nEE@

  if (i == 1) print      list = "new_taz, original_taz" printo = 1
  print csv=t form = 8.0 list =  i, (i + 961) printo = 1

  LOOP _J=1,ZONES

      @cmt01@ MW[101][_j] = matval( 1, 01, i + @nLastInt@, _j + @nLastInt@ )
      @cmt02@ MW[102][_j] = matval( 1, 02, i + @nLastInt@, _j + @nLastInt@ )
      @cmt03@ MW[103][_j] = matval( 1, 03, i + @nLastInt@, _j + @nLastInt@ )
      @cmt04@ MW[104][_j] = matval( 1, 04, i + @nLastInt@, _j + @nLastInt@ )
      @cmt05@ MW[105][_j] = matval( 1, 05, i + @nLastInt@, _j + @nLastInt@ )
      @cmt06@ MW[106][_j] = matval( 1, 06, i + @nLastInt@, _j + @nLastInt@ )
      @cmt07@ MW[107][_j] = matval( 1, 07, i + @nLastInt@, _j + @nLastInt@ )
      @cmt08@ MW[108][_j] = matval( 1, 08, i + @nLastInt@, _j + @nLastInt@ )
      @cmt09@ MW[109][_j] = matval( 1, 09, i + @nLastInt@, _j + @nLastInt@ )
      @cmt10@ MW[110][_j] = matval( 1, 10, i + @nLastInt@, _j + @nLastInt@ )
      @cmt11@ MW[111][_j] = matval( 1, 11, i + @nLastInt@, _j + @nLastInt@ )
      @cmt12@ MW[112][_j] = matval( 1, 12, i + @nLastInt@, _j + @nLastInt@ )
      @cmt13@ MW[113][_j] = matval( 1, 13, i + @nLastInt@, _j + @nLastInt@ )
      @cmt14@ MW[114][_j] = matval( 1, 14, i + @nLastInt@, _j + @nLastInt@ )
      @cmt15@ MW[115][_j] = matval( 1, 15, i + @nLastInt@, _j + @nLastInt@ )
      @cmt16@ MW[116][_j] = matval( 1, 16, i + @nLastInt@, _j + @nLastInt@ )
      @cmt17@ MW[117][_j] = matval( 1, 17, i + @nLastInt@, _j + @nLastInt@ )
      @cmt18@ MW[118][_j] = matval( 1, 18, i + @nLastInt@, _j + @nLastInt@ )
      @cmt19@ MW[119][_j] = matval( 1, 19, i + @nLastInt@, _j + @nLastInt@ )
      @cmt20@ MW[120][_j] = matval( 1, 20, i + @nLastInt@, _j + @nLastInt@ )

      // ENDLOOP
  ENDLOOP
ENDRUN
