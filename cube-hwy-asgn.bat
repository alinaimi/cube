/*
set @=%~f0&call "%~dp0cube-p" %*

@rem set zones=3772

VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout.exe 10 &EXIT 0&goto:eof&::----------------------------------------------------------*/ %add2script%

RUN PGM=HIGHWAY
  FILEI NETI = "%dpnx1%"; Network.net
  FILEI MATI[1] = "%dpnx2%"; TRIPS.mat
  FILEO NETO = "%dpn1%-%n2%-loaded.net"
  FILEO VOLO = "%dpn1%-%n2%-volo"
  TURNPENI ="%dp1%\turnpen.pen"
  ;FILEO PATHO[1] = "TOLLPATH.PTH"

  ;FILEI SUBAREANETI=subarea1.net
  ;FILEO SUBAREAMATO=submat1.mat

  ; PARAMETERS COMBINE=EQUI MAXITERS = 99 GAP=.0001
  PARAMETERS COMBINE=EQUI MAXITERS = 1 GAP=.0001
  
  PROCESS PHASE = LINKREAD
    ;C = LI.CAPACITY ; set capacity equal to a link field
    ;C = LI.NETYEAR; 1000
    ;CAPACITY = LI.CAPACITY * 1.0
    C     = CAPACITYFOR(LI.AMLANE,LI.CAPCLASS)
    SPEED = SPEEDFOR(LI.AMLANE,LI.SPDCLASS)
    T0    = (LI.DISTANCE/SPEED)*60.0
    ;T0=li.TIME_1
    T1=T0
    ;LINKCLASS=LI.CLASS
    LINKCLASS=LI.FTYPE+1
  ENDPROCESS
  
  PROCESS PHASE=ILOOP ; main loop for program
    PATHLOAD PATH=TIME, ; build path based on time ( must be LW.name TIME  COST  LINKCOST  DIST  A  B  )

    VOL[1]=MI.1.1
  ENDPROCESS
  
  //ADJUST1
  ; No TC functions defined therefore congested travel times computed using the standard BPR formula for all links.
  ; No COST function defined therefore COST defaults to TIME
  
  //ADJUST2
  ;PHASE=ADJUST
  ;; volume function V sets the volume to use for V/C in the delay function
  ;; No delay functions (TC[#]=) are specified here so the default BPR
  ;; formula is used for all link classes
  ;  FUNCTION V=VOL[6] ; set volume to use in congested travel time functions
  ;ENDPHASE

  //ADJUST3
  ;PROCESS PHASE=ADJUST
  ;function {
  ;  tc=t0*(1.0+LW.COEF*((v/c)^LW.EXPO)) ; congested time function for major roads
  ;}
  ;ENDPHASE

  //ADJUST4
  ;PROCESS PHASE=ADJUST
  ;  ; Define cost and delay functions
  ;  function {
  ;    tc[1]=t0*(1.0+0.15*((v/c)^8)); congested time function for major roads
  ;    tc[2]=t0*(1.0+0.15*((v/c)^4)); congested time function for minor roads
  ;    cost[1]=time*time_cost1+li.distance*distance_cost1 ; cost function for major roads
  ;    cost[2]=time*time_cost2+li.distance*distance_cost2 ; cost function for minor roads
  ;  }
  ;ENDPROCESS
ENDRUN
