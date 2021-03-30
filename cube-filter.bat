/*
set @=%~f0&call "%~dp0cube-p" %*

@set headers=A,B,SLID,I424VOL

VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::███████*/ %add2script%

;RUN PGM=MATRIX
  ;;get 1st 5 data fields as numeric fields and also as character fields
  ;;FILEI RECI = junk.txt,Fields=1(c5),1(n5)
  ;FILEI RECI = "%dpn1%-link.dbf"
  ;;FILEO RECO[1]=junkout.dbf FIELDS=reci.allfields
  ;FILEO PRINTO[1]=junkprn.prn
  ;;write reco=1
  ;print printo=1 form=5lr,list='\nRecno=',reci.recno,'
  ;;NumFields=',reci.numfields, ' highest field=',reci.fields,' lng=',reci.lng
  ;print printo=1 form=5lr,list=reci,'\ncfield[1-5] ='
  ;,reci.cfield[1],'..',reci.cfield[2],'..',reci.cfield[3],'..'
  ;,reci.cfield[4],'..',reci.cfield[5],'..\nnfield[6-9] ='
  ;,ri.field1,'..',ri.field2,'..',ri.field3,'..'
  ;,ri.field4,'..',ri.field5,'..\nri.field6..10='
;endrun

;! MATRIX to filter the DBF and have just the links containing counts and statistics.
RUN PGM = MATRIX
  FILEI RECI = "%dpn1%" , SORT = SLID
  FILEO RECO[1] = "%dpn1%-filtered.dbf" , FIELDS =  %headers%
  ;if (A==776.00 && B==27923) PRINT file="%dpn1%-link_.csv", List="%headers%"
  
  IF (RI.SLID > 0)
    WRITE RECO = 1
  ENDIF
ENDRUN
