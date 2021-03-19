/*
set @=%~n0&call "%~dp0cube-p" %*

@rem @del /a /f /q "%wd%\%pppp%*.prn"
@del /a /f /q "%wd%\TPPL.PRJ" &::! to prevent reseting the counter

@set link_a=22500,23013,35631,23603
@set link_b=23014,34001,23604,35630

@set headers=LI.1.A(10.0L), LI.1.B(10.0L),LI.1.I4AMVOL,LI.1.I4PMVOL,LI.1.I4MDVOL,LI.1.I4NTVOL,LI.1.I4AMVOL,LI.1.I4AMVMT,LI.1.I424VOL,I324VOL,I424VOL
@rem @set headers=SLID,A,B,I324VOL,I424VOL,FTYPE
::  ; , INCLUDE = A, B, SLID, I424VOL, LINKID, FTYPE, ROADSEGMENT, CORRIDOR, ROADTYPE, SEGMENT, TOLL, TOLLGRP, MINTOLL, TOLLDISTANC, DEFLATIONFT, AMTOLL, PMTOLL, OPTOLL, AMTOLL_VP, PMTOLL_VP, OPTOLL_VP, PLAZAID, DIRLETTER, N1LANE, AMLANE, M1LANE, M2LANE, PMLANE, N2LANE, OPLANE, NTLANE, ;, RECI.allfields ;, RECI[1].allfields

@rem @setlocal EnableDelayedExpansion EnableExpansion
VOYAGER "%~dpnx0" %args%
@rem TPPLUS "%~dpnx0" %args%
@REM RUNTPP VOYAGER "%~dpnx0" %args%

::! add headers to 1st line
@echo %headers% > "%dpn1%-link.tmp"
@type "%dpn1%-link.csv" >> "%dpn1%-link.tmp"
@type "%dpn1%-link.tmp" > "%dpn1%-link.csv"
@del /a /f /q "%dpn1%-link.tmp"

@%SystemRoot%\System32\timeout 10 &goto:eof&::-------------------*/ %add2script%


//  // -- MWCOG
//  var sql = "SELECT "
//  sql += "sum(DISTANCE*I4AMVOL)/1000000 AMVMT, sum(DISTANCE*I4PMVOL)/1000000 PMVMT, sum(DISTANCE*I4MDVOL)/1000000 MDVMT, sum(DISTANCE*I4NTVOL)/1000000 NTVMT, sum(DISTANCE*I424VOL)/1000000 VMT24,"
//  sql += "sum(I4AMVOL*AMHTIME/60/1000000) AMVHT,"
//  sql += "sum(I4PMVOL*PMHTIME/60/1000000) PMVHT,"
//  sql += "sum(I4MDVOL*MDHTIME/60/1000000) MDVHT,"
//  sql += "sum(I4NTVOL*NTHTIME/60/1000000) NTVHT,"
//  sql += "sum(I4AMVOL*AMHTIME+I4MDVOL*MDHTIME+I4PMVOL*PMHTIME+I4NTVOL*NTHTIME)/60/1000000 VHT24,"
//  sql += "sum(I4AMVMT)/1000000 AMVMT_cchk, sum(I4PMVMT)/1000000 PMVMT_cchk, sum(I4MDVMT)/1000000 MDVMT_cchk, sum(I4NTVMT)/1000000 NTVMT_cchk, sum(I4AMVMT+I4PMVMT+I4MDVMT+I4NTVMT)/1000000 VMT24_cchk,"
//  sql += "sum(I424VOL), sum(TVMT00),"
//  sql += "avg(I4AMSPD), avg(I4PMSPD), avg(I4MDSPD), avg(I4NTSPD)"
//  sql += " FROM '" + fn.woExt + "'"
//  sql += " WHERE FTYPE <> 0"
//  var cmd = "ogr2ogr -dialect SQLite -sql \"" + sql + "\" -f CSV \"" + fn.woExt + "_cog_sum.csv\"" + " \"" + fn.full + "\""
//  exec(cmd);

//  var sql = "SELECT a.A A, a.B B, a.segment segment,"
//  sql += "round( (b.I4AMSOV+b.I4AMHV2*2+b.I4AMHV3*3.5+b.I4AMCV+b.I4AMTRK+b.I4AMAPX)/3,1) AM_Peak_Hourly_Person_Throughput,"
//  sql += "round( (b.I4PMSOV+b.I4PMHV2*2+b.I4PMHV3*3.5+b.I4PMCV+b.I4PMTRK+b.I4PMAPX)/4,1) PM_Peak_Hourly_Person_Throughput,"
//  sql += "round( (b.I4MDSOV+b.I4MDHV2*2+b.I4MDHV3*3.5+b.I4MDCV+b.I4MDTRK+b.I4MDAPX)/6,1) MD_Hourly_Person_Throughput,"
//  sql += "round( (b.I4NTSOV+b.I4NTHV2*2+b.I4NTHV3*3.5+b.I4NTCV+b.I4NTTRK+b.I4NTAPX)/11,1) NT_Hourly_Person_Throughput,"
//  sql += "b.I4AMSOV/1000000,b.I4AMHV2/1000000,b.I4AMHV3/1000000,b.I4AMCV/1000000,b.I4AMTRK/1000000,b.I4AMAPX/1000000,b.I4AMVOL/1000000,b.I4AMVMT/1000000,"
//  sql += "b.I4PMSOV/1000000,b.I4PMHV2/1000000,b.I4PMHV3/1000000,b.I4PMCV/1000000,b.I4PMTRK/1000000,b.I4PMAPX/1000000,b.I4PMVOL/1000000,b.I4PMVMT/1000000,"
//  sql += "b.I4MDSOV/1000000,b.I4MDHV2/1000000,b.I4MDHV3/1000000,b.I4MDCV/1000000,b.I4MDTRK/1000000,b.I4MDAPX/1000000,b.I4MDVOL/1000000,b.I4MDVMT/1000000,"
//  sql += "b.I4NTSOV/1000000,b.I4NTHV2/1000000,b.I4NTHV3/1000000,b.I4NTCV/1000000,b.I4NTTRK/1000000,b.I4NTAPX/1000000,b.I4NTVOL/1000000,b.I4NTVMT/1000000 "
//  sql += "FROM 'c:sel.tsv'.sel as a left join '" + fn.woExt + "' as b on a.A = b.A and a.B = b.B"

//  // -- FFX
//  var sql = "SELECT "
//  sql += "sum(DISTANCE*AMVOL)/1000000 AMVMT, sum(DISTANCE*PMVOL)/1000000 PMVMT, sum(DISTANCE*OPVOL)/1000000 OPVMT,'' _, sum(DISTANCE*VOL24)/1000000 VMT24,"
//  sql += "sum(AMVOL*AMTIME/60)/1000000 AMVHT, sum(PMVOL*PMTIME/60)/1000000 PMVHT, sum(OPVOL*OPTIME/60)/1000000 OPVHT,'' _2,"
//  sql += "sum(AMVOL*AMTIME/60+PMVOL*PMTIME/60+OPVOL*OPTIME/60)/1000000 VHT24," // in FFX, OP=MD+NT
//  sql += "sum(VOL24*CTIME/60)/1000000 VHT24_," // congested timeXXX
//  sql += "sum(AMVMT)/1000000 AMVMT_cchk, sum(PMVMT)/1000000 PMVMT_cchk, sum(OPVMT)/1000000 OPVMT_cchk, sum(AMVMT+PMVMT+OPVMT)/1000000 VMT24_cchk,"
//  sql += "sum(VDT_2), sum(VHT_2), sum(VOL24), sum(AMPKVOL), sum(PMPKVOL),"
//  sql += "avg(DISTANCE*AMHTIME*60), avg(I1AMSPD), avg(I1PMSPD), avg(I1OPSPD) PPAMSPD_"
//  sql += " FROM '" + fn.woExt + "'"
//  sql += " WHERE FTYPE <> 0"
//  var cmd = "ogr2ogr -dialect SQLite -sql \"" + sql + "\" -f CSV \"" + fn.woExt + "_ffx_sum.csv\"" + " \"" + fn.full + "\""
//  exec(cmd);

//  // var sql="SELECT * FROM \"" + fn.woExt + "\""
//  var sql = "SELECT a.A A, a.B B, a.segment segment,"
//  sql += "round( (b.AMSOV+b.AMHV2*2+b.AMHV3*3.5+b.AMCV+b.AMTRK+b.AMAPX)/3,1) AM_Peak_Hourly_Person_Throughput,"
//  sql += "round( (b.PMSOV+b.PMHV2*2+b.PMHV3*3.5+b.PMCV+b.PMTRK+b.PMAPX)/4,1) PM_Peak_Hourly_Person_Throughput, '' MD_Hourly_Person_Throughput,"
//  sql += "round( (b.OPSOV+b.OPHV2*2+b.OPHV3*3.5+b.OPCV+b.OPTRK+b.OPAPX)/11,1) OP_Hourly_Person_Throughput,"
//  sql += "b.AMSOV,b.AMHV2,b.AMHV3,b.AMCV,b.AMTRK,b.AMAPX,b.AMVOL,b.AMVMT,"
//  sql += "b.PMSOV,b.PMHV2,b.PMHV3,b.PMCV,b.PMTRK,b.PMAPX,b.PMVOL,b.PMVMT,"
//  sql += "b.OPSOV,b.OPHV2,b.OPHV3,b.OPCV,b.OPTRK,b.OPAPX,b.OPVOL,b.OPVMT "
//  sql += "FROM 'c:/sel.tsv'.sel as a left join '" + fn.woExt + "' as b on a.A = b.A and a.B = b.B"

RUN PGM=NETWORK     ; Unbuild network into dbf's
  FILEI NETI[1] = "%dpnx1%"

  // FILEO NODEO = "%dpn1%-node.csv", FORMAT = CSV
  // FILEO LINKO = "%dpn1%-link.csv", FORMAT = CSV, INCLUDE = %headers%
  FILEO PRINTO[1]="%dpn1%-link.csv"
  ;phase=iloop
  if (A==%link_a% && B==%link_b%) PRINT printo=1, List=%headers%
  ;FILEO NODEO    = "%dpn1%-node.csv", FORMAT = CSV
  ;FILEO LINKO    = "%dpn1%-link.csv", FORMAT = CSV
  ;FILEO LINKO[1] = "%dpn1%.dbf", FORMAT = DBF
  ;FILEO LINKO[2] = "%dpn1%.csv", FORMAT = CSV
  ;INCLUDE = %headers%
ENDRUN
