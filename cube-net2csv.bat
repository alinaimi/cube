/*
set @=%~f0&call "%~dp0cube-p" %*

@set headers=A,B,I324VOL,I424VOL

VOYAGER "%~dpnx0" %args%

::! add headers to 1st line
@echo %headers% > "%dpn1%-link.tmp"
@type "%dpn1%-link.csv" >> "%dpn1%-link.tmp"
@type "%dpn1%-link.tmp" > "%dpn1%-link.csv"
@del /a /f /q "%dpn1%-link.tmp"

@%SystemRoot%\System32\timeout 10 &goto:eof&::-------*/ %add2script%

// distribute intrastep=t multistep=t
DistributeMULTISTEP ProcessID='all', ProcessNum=1

RUN PGM=NETWORK     ; Unbuild network into dbf's
// distributeIntrastep processId='all', ProcessList=1
  FILEI NETI = "%dpnx1%"
  FILEO NODEO = "%dpn1%-node.dbf", FORMAT = DBF; options: CSV DBF ...
  FILEO LINKO = "%dpn1%-link.dbf", FORMAT = DBF; INCLUDE = %headers%
ENDRUN

RUN PGM = NETWORK
// distributeIntrastep processId='all', ProcessList=2
FILEI NETI[1] = "%dpnx1%"
FILEO NODEO   = "%dpn1%-node.csv", FORMAT = CSV
FILEO LINKO   = "%dpn1%-link.csv", FORMAT = CSV, INCLUDE = %headers%
ENDRUN

ENDDistributeMULTISTEP
