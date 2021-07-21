/*
@set get_inf=2
set @=%~f0&call "%~dp0cube-p" %*

set mat1_size=%n_mat%

@rem SET n_name=AUTO,TRK,ALL,PCT_AUTO,PCT_TRK,PCT_ALL,
@rem SET n_name_j=%n_name:AUTO=sum_AUTO_o%
SET n_name_col=%n_name:,=_j,%
SET n_name_col=%n_name_col%_j
@rem echo n_name:   %n_name%
@rem echo n_name_j: %n_name_col%

@for /f "tokens=1*"  %%G in ('echo %n_name%') do @set n_name_01=%%G
@for /f "tokens=2*"  %%G in ('echo %n_name%') do @set n_name_02=%%G
@for /f "tokens=3*"  %%G in ('echo %n_name%') do @set n_name_03=%%G
@for /f "tokens=4*"  %%G in ('echo %n_name%') do @set n_name_04=%%G
@for /f "tokens=5*"  %%G in ('echo %n_name%') do @set n_name_05=%%G
@for /f "tokens=6*"  %%G in ('echo %n_name%') do @set n_name_06=%%G
@for /f "tokens=7*"  %%G in ('echo %n_name%') do @set n_name_07=%%G
@for /f "tokens=8*"  %%G in ('echo %n_name%') do @set n_name_08=%%G
@for /f "tokens=9*"  %%G in ('echo %n_name%') do @set n_name_09=%%G
@for /f "tokens=10*" %%G in ('echo %n_name%') do @set n_name_10=%%G
@for /f "tokens=11*" %%G in ('echo %n_name%') do @set n_name_11=%%G
@for /f "tokens=12*" %%G in ('echo %n_name%') do @set n_name_12=%%G
@for /f "tokens=13*" %%G in ('echo %n_name%') do @set n_name_13=%%G
@for /f "tokens=14*" %%G in ('echo %n_name%') do @set n_name_14=%%G
@for /f "tokens=15*" %%G in ('echo %n_name%') do @set n_name_15=%%G
@for /f "tokens=16*" %%G in ('echo %n_name%') do @set n_name_16=%%G
@for /f "tokens=17*" %%G in ('echo %n_name%') do @set n_name_17=%%G
@for /f "tokens=18*" %%G in ('echo %n_name%') do @set n_name_18=%%G
@for /f "tokens=19*" %%G in ('echo %n_name%') do @set n_name_19=%%G
@for /f "tokens=20*" %%G in ('echo %n_name%') do @set n_name_20=%%G

@rem set /a i=1
@rem for %%a in ("%n_name:,=" "%") do (
@rem  echo %i%: %%a
@rem  set /a i+=1
@rem )
@rem for /l %%i in (0,1,5) do (
@rem   echo %%i
@rem )

%reset_rpt%
VOYAGER "%~f0" %args%

@call "%~dp0cube-q" %* &goto:eof&::------------------------------*/%add2script%

READ FILE = '%dp0%cube-cmt.bat'

RUN PGM=MATRIX PRNFILE="%PRNFILE%"
          MATI[1] = "%f1%"
  FILEO PRINTO[1] = "%dpn1%-sumRowCol.csv"

  @cmt01@ FILEO PRINTO[101] = "%dpn1%-sumRowCol_01_%n_name_01%.csv"
  @cmt02@ FILEO PRINTO[102] = "%dpn1%-sumRowCol_02_%n_name_02%.csv"
  @cmt03@ FILEO PRINTO[103] = "%dpn1%-sumRowCol_03_%n_name_03%.csv"
  @cmt04@ FILEO PRINTO[104] = "%dpn1%-sumRowCol_04_%n_name_04%.csv"
  @cmt05@ FILEO PRINTO[105] = "%dpn1%-sumRowCol_05_%n_name_05%.csv"
  @cmt06@ FILEO PRINTO[106] = "%dpn1%-sumRowCol_06_%n_name_06%.csv"
  @cmt07@ FILEO PRINTO[107] = "%dpn1%-sumRowCol_07_%n_name_07%.csv"
  @cmt08@ FILEO PRINTO[108] = "%dpn1%-sumRowCol_08_%n_name_08%.csv"
  @cmt09@ FILEO PRINTO[109] = "%dpn1%-sumRowCol_09_%n_name_09%.csv"
  @cmt10@ FILEO PRINTO[110] = "%dpn1%-sumRowCol_10_%n_name_10%.csv"
  @cmt11@ FILEO PRINTO[111] = "%dpn1%-sumRowCol_11_%n_name_11%.csv"
  @cmt12@ FILEO PRINTO[112] = "%dpn1%-sumRowCol_12_%n_name_12%.csv"
  @cmt13@ FILEO PRINTO[113] = "%dpn1%-sumRowCol_13_%n_name_13%.csv"
  @cmt14@ FILEO PRINTO[114] = "%dpn1%-sumRowCol_14_%n_name_14%.csv"
  @cmt15@ FILEO PRINTO[115] = "%dpn1%-sumRowCol_15_%n_name_15%.csv"
  @cmt16@ FILEO PRINTO[116] = "%dpn1%-sumRowCol_16_%n_name_16%.csv"
  @cmt17@ FILEO PRINTO[117] = "%dpn1%-sumRowCol_17_%n_name_17%.csv"
  @cmt18@ FILEO PRINTO[118] = "%dpn1%-sumRowCol_18_%n_name_18%.csv"
  @cmt19@ FILEO PRINTO[119] = "%dpn1%-sumRowCol_19_%n_name_19%.csv"
  @cmt20@ FILEO PRINTO[120] = "%dpn1%-sumRowCol_20_%n_name_20%.csv"

  @cmt01@ MW[01]=MI.1.01
  @cmt02@ MW[02]=MI.1.02
  @cmt03@ MW[03]=MI.1.03
  @cmt04@ MW[04]=MI.1.04
  @cmt05@ MW[05]=MI.1.05
  @cmt06@ MW[06]=MI.1.06
  @cmt07@ MW[07]=MI.1.07
  @cmt08@ MW[08]=MI.1.08
  @cmt09@ MW[09]=MI.1.09
  @cmt10@ MW[10]=MI.1.10
  @cmt11@ MW[11]=MI.1.11
  @cmt12@ MW[12]=MI.1.12
  @cmt13@ MW[13]=MI.1.13
  @cmt14@ MW[14]=MI.1.14
  @cmt15@ MW[15]=MI.1.15
  @cmt16@ MW[16]=MI.1.16
  @cmt17@ MW[17]=MI.1.17
  @cmt18@ MW[18]=MI.1.18
  @cmt19@ MW[19]=MI.1.19
  @cmt20@ MW[20]=MI.1.20

  @cmt01@ ROWSUM_01=ROWSUM(01)
  @cmt02@ ROWSUM_02=ROWSUM(02)
  @cmt03@ ROWSUM_03=ROWSUM(03)
  @cmt04@ ROWSUM_04=ROWSUM(04)
  @cmt05@ ROWSUM_05=ROWSUM(05)
  @cmt06@ ROWSUM_06=ROWSUM(06)
  @cmt07@ ROWSUM_07=ROWSUM(07)
  @cmt08@ ROWSUM_08=ROWSUM(08)
  @cmt09@ ROWSUM_09=ROWSUM(09)
  @cmt10@ ROWSUM_10=ROWSUM(10)
  @cmt11@ ROWSUM_11=ROWSUM(11)
  @cmt12@ ROWSUM_12=ROWSUM(12)
  @cmt13@ ROWSUM_13=ROWSUM(13)
  @cmt14@ ROWSUM_14=ROWSUM(14)
  @cmt15@ ROWSUM_15=ROWSUM(15)
  @cmt16@ ROWSUM_16=ROWSUM(16)
  @cmt17@ ROWSUM_17=ROWSUM(17)
  @cmt18@ ROWSUM_18=ROWSUM(18)
  @cmt19@ ROWSUM_19=ROWSUM(19)
  @cmt20@ ROWSUM_20=ROWSUM(20)

  //!--- Sum columns
  @cmt01@ COLSUM_01 = 0
  @cmt02@ COLSUM_02 = 0
  @cmt03@ COLSUM_03 = 0
  @cmt04@ COLSUM_04 = 0
  @cmt05@ COLSUM_05 = 0
  @cmt06@ COLSUM_06 = 0
  @cmt07@ COLSUM_07 = 0
  @cmt08@ COLSUM_08 = 0
  @cmt09@ COLSUM_09 = 0
  @cmt10@ COLSUM_10 = 0
  @cmt11@ COLSUM_11 = 0
  @cmt12@ COLSUM_12 = 0
  @cmt13@ COLSUM_13 = 0
  @cmt14@ COLSUM_14 = 0
  @cmt15@ COLSUM_15 = 0
  @cmt16@ COLSUM_16 = 0
  @cmt17@ COLSUM_17 = 0
  @cmt18@ COLSUM_18 = 0
  @cmt19@ COLSUM_19 = 0
  @cmt20@ COLSUM_20 = 0
  LOOP _J=1,ZONES
    // LOOP _k=1,ZONES
      // PRINT LIST=i,j,_j,_k,' = ', MW[1][_J], MATI1[I][_j] ,' ; ', MATI2[_k][_J]
      // MW[1][_j] = MATI1[i][_j] + MATI2[i][_j]
      @cmt01@ COLSUM_01 = COLSUM_01 + matval( 1, 01, _j, i )
      @cmt02@ COLSUM_02 = COLSUM_02 + matval( 1, 02, _j, i )
      @cmt03@ COLSUM_03 = COLSUM_03 + matval( 1, 03, _j, i )
      @cmt04@ COLSUM_04 = COLSUM_04 + matval( 1, 04, _j, i )
      @cmt05@ COLSUM_05 = COLSUM_05 + matval( 1, 05, _j, i )
      @cmt06@ COLSUM_06 = COLSUM_06 + matval( 1, 06, _j, i )
      @cmt07@ COLSUM_07 = COLSUM_07 + matval( 1, 07, _j, i )
      @cmt08@ COLSUM_08 = COLSUM_08 + matval( 1, 08, _j, i )
      @cmt09@ COLSUM_09 = COLSUM_09 + matval( 1, 09, _j, i )
      @cmt10@ COLSUM_10 = COLSUM_10 + matval( 1, 10, _j, i )
      @cmt11@ COLSUM_11 = COLSUM_11 + matval( 1, 11, _j, i )
      @cmt12@ COLSUM_12 = COLSUM_12 + matval( 1, 12, _j, i )
      @cmt13@ COLSUM_13 = COLSUM_13 + matval( 1, 13, _j, i )
      @cmt14@ COLSUM_14 = COLSUM_14 + matval( 1, 14, _j, i )
      @cmt15@ COLSUM_15 = COLSUM_15 + matval( 1, 15, _j, i )
      @cmt16@ COLSUM_16 = COLSUM_16 + matval( 1, 16, _j, i )
      @cmt17@ COLSUM_17 = COLSUM_17 + matval( 1, 17, _j, i )
      @cmt18@ COLSUM_18 = COLSUM_18 + matval( 1, 18, _j, i )
      @cmt19@ COLSUM_19 = COLSUM_19 + matval( 1, 19, _j, i )
      @cmt20@ COLSUM_20 = COLSUM_20 + matval( 1, 20, _j, i )
  ENDLOOP

  if (i == 1) print      printo = 1 list = "taz", ",%n_name%", ",%n_name_col%"
  print csv=t form = 8.2 printo = 1 list = i(6.0),

  @cmt01@ ROWSUM_01,@cmt02@ ROWSUM_02,@cmt03@ ROWSUM_03,@cmt04@ ROWSUM_04,@cmt05@ ROWSUM_05,@cmt06@ ROWSUM_06,@cmt07@ ROWSUM_07,@cmt08@ ROWSUM_08,@cmt09@ ROWSUM_09,@cmt10@ ROWSUM_10,@cmt11@ ROWSUM_11,@cmt12@ ROWSUM_12,@cmt13@ ROWSUM_13,@cmt14@ ROWSUM_14,@cmt15@ ROWSUM_15,@cmt16@ ROWSUM_16,@cmt17@ ROWSUM_17,@cmt18@ ROWSUM_18,@cmt19@ ROWSUM_19,@cmt20@ ROWSUM_20

  COLSUM_01@cmt02@,COLSUM_02@cmt03@,COLSUM_03@cmt04@,COLSUM_04@cmt05@,COLSUM_05@cmt06@,COLSUM_06@cmt07@,COLSUM_07@cmt08@,COLSUM_08@cmt09@,COLSUM_09@cmt10@,COLSUM_10@cmt11@,COLSUM_11@cmt12@,COLSUM_12@cmt13@,COLSUM_13@cmt14@,COLSUM_14@cmt15@,COLSUM_15@cmt16@,COLSUM_16@cmt17@,COLSUM_17@cmt18@,COLSUM_18@cmt19@,COLSUM_19@cmt20@,COLSUM_20

  ; @cmt01@ ROWSUM_01,
  ; @cmt02@ ROWSUM_02,
  ; @cmt03@ ROWSUM_03,
  ; @cmt04@ ROWSUM_04,
  ; @cmt05@ ROWSUM_05,
  ; @cmt06@ ROWSUM_06,
  ; @cmt07@ ROWSUM_07,
  ; @cmt08@ ROWSUM_08,
  ; @cmt09@ ROWSUM_09,
  ; @cmt10@ ROWSUM_10,
  ; @cmt11@ ROWSUM_11,
  ; @cmt12@ ROWSUM_12,
  ; @cmt13@ ROWSUM_13,
  ; @cmt14@ ROWSUM_14,
  ; @cmt15@ ROWSUM_15,
  ; @cmt16@ ROWSUM_16,
  ; @cmt17@ ROWSUM_17,
  ; @cmt18@ ROWSUM_18,
  ; @cmt19@ ROWSUM_19,
  ; @cmt20@ ROWSUM_20,
  ; @cmt01@ COLSUM_01,
  ; @cmt02@ COLSUM_02,
  ; @cmt03@ COLSUM_03,
  ; @cmt04@ COLSUM_04,
  ; @cmt05@ COLSUM_05,
  ; @cmt06@ COLSUM_06,
  ; @cmt07@ COLSUM_07,
  ; @cmt08@ COLSUM_08,
  ; @cmt09@ COLSUM_09,
  ; @cmt10@ COLSUM_10,
  ; @cmt11@ COLSUM_11,
  ; @cmt12@ COLSUM_12,
  ; @cmt13@ COLSUM_13,
  ; @cmt14@ COLSUM_14,
  ; @cmt15@ COLSUM_15,
  ; @cmt16@ COLSUM_16,
  ; @cmt17@ COLSUM_17,
  ; @cmt18@ COLSUM_18,
  ; @cmt19@ COLSUM_19,
  ; @cmt20@ COLSUM_20,

  ;!--- split into files
  if (i == 1)
    @cmt01@ print printo = 101 list = "taz, sum_i, sum_j"
    @cmt02@ print printo = 102 list = "taz, sum_i, sum_j"
    @cmt03@ print printo = 103 list = "taz, sum_i, sum_j"
    @cmt04@ print printo = 104 list = "taz, sum_i, sum_j"
    @cmt05@ print printo = 105 list = "taz, sum_i, sum_j"
    @cmt06@ print printo = 106 list = "taz, sum_i, sum_j"
    @cmt07@ print printo = 107 list = "taz, sum_i, sum_j"
    @cmt08@ print printo = 108 list = "taz, sum_i, sum_j"
    @cmt09@ print printo = 109 list = "taz, sum_i, sum_j"
    @cmt10@ print printo = 110 list = "taz, sum_i, sum_j"
    @cmt11@ print printo = 111 list = "taz, sum_i, sum_j"
    @cmt12@ print printo = 112 list = "taz, sum_i, sum_j"
    @cmt13@ print printo = 113 list = "taz, sum_i, sum_j"
    @cmt14@ print printo = 114 list = "taz, sum_i, sum_j"
    @cmt15@ print printo = 115 list = "taz, sum_i, sum_j"
    @cmt16@ print printo = 116 list = "taz, sum_i, sum_j"
    @cmt17@ print printo = 117 list = "taz, sum_i, sum_j"
    @cmt18@ print printo = 118 list = "taz, sum_i, sum_j"
    @cmt19@ print printo = 119 list = "taz, sum_i, sum_j"
    @cmt20@ print printo = 120 list = "taz, sum_i, sum_j"
  ENDIF

  @cmt01@ print csv=t form = 8.2 printo = 101 list = i(6.0),ROWSUM_01,COLSUM_01
  @cmt02@ print csv=t form = 8.2 printo = 102 list = i(6.0),ROWSUM_02,COLSUM_02
  @cmt03@ print csv=t form = 8.2 printo = 103 list = i(6.0),ROWSUM_03,COLSUM_03
  @cmt04@ print csv=t form = 8.2 printo = 104 list = i(6.0),ROWSUM_04,COLSUM_04
  @cmt05@ print csv=t form = 8.2 printo = 105 list = i(6.0),ROWSUM_05,COLSUM_05
  @cmt06@ print csv=t form = 8.2 printo = 106 list = i(6.0),ROWSUM_06,COLSUM_06
  @cmt07@ print csv=t form = 8.2 printo = 107 list = i(6.0),ROWSUM_07,COLSUM_07
  @cmt08@ print csv=t form = 8.2 printo = 108 list = i(6.0),ROWSUM_08,COLSUM_08
  @cmt09@ print csv=t form = 8.2 printo = 109 list = i(6.0),ROWSUM_09,COLSUM_09
  @cmt10@ print csv=t form = 8.2 printo = 110 list = i(6.0),ROWSUM_10,COLSUM_10
  @cmt11@ print csv=t form = 8.2 printo = 111 list = i(6.0),ROWSUM_11,COLSUM_11
  @cmt12@ print csv=t form = 8.2 printo = 112 list = i(6.0),ROWSUM_12,COLSUM_12
  @cmt13@ print csv=t form = 8.2 printo = 113 list = i(6.0),ROWSUM_13,COLSUM_13
  @cmt14@ print csv=t form = 8.2 printo = 114 list = i(6.0),ROWSUM_14,COLSUM_14
  @cmt15@ print csv=t form = 8.2 printo = 115 list = i(6.0),ROWSUM_15,COLSUM_15
  @cmt16@ print csv=t form = 8.2 printo = 116 list = i(6.0),ROWSUM_16,COLSUM_16
  @cmt17@ print csv=t form = 8.2 printo = 117 list = i(6.0),ROWSUM_17,COLSUM_17
  @cmt18@ print csv=t form = 8.2 printo = 118 list = i(6.0),ROWSUM_18,COLSUM_18
  @cmt19@ print csv=t form = 8.2 printo = 119 list = i(6.0),ROWSUM_19,COLSUM_19
  @cmt20@ print csv=t form = 8.2 printo = 120 list = i(6.0),ROWSUM_20,COLSUM_20
ENDRUN
