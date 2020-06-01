/*
@call "%~dp0cube_p" %*&&@TITLE %~n0 (%*)&@echo -- %~n0 (%*)

@set al_o_link=%~dp1%~n1_link
@set al_o_node=%~dp1%~n1_node

@set crs=PROJCS["NAD_1983_2011_StatePlane_Maryland_FIPS_1900_Ft_US",GEOGCS["GCS_NAD_1983_2011",DATUM["D_NAD_1983_2011",SPHEROID["GRS_1980",6378137.0,298.257222101]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]],PROJECTION["Lambert_Conformal_Conic"],PARAMETER["False_Easting",1312333.333333333],PARAMETER["False_Northing",0.0],PARAMETER["Central_Meridian",-77.0],PARAMETER["Standard_Parallel_1",38.3],PARAMETER["Standard_Parallel_2",39.45],PARAMETER["Latitude_Of_Origin",37.66666666666666],UNIT["Foot_US",0.3048006096012192]]
@rem @set crs=PROJCS["NAD_1983_StatePlane_Virginia_North_FIPS_4501_Feet",GEOGCS["GCS_North_American_1983",DATUM["D_North_American_1983",SPHEROID["GRS_1980",6378137,298.257222101]],PRIMEM["Greenwich",0],UNIT["Degree",0.017453292519943295]],PROJECTION["Lambert_Conformal_Conic"],PARAMETER["False_Easting",11482916.66666666],PARAMETER["False_Northing",6561666.666666666],PARAMETER["Central_Meridian",-78.5],PARAMETER["Standard_Parallel_1",38.03333333333333],PARAMETER["Standard_Parallel_2",39.2],PARAMETER["Latitude_Of_Origin",37.66666666666666],UNIT["Foot_US",0.30480060960121924]]
@echo %crs%>"%al_o_link%.prj" &type "%al_o_link%.prj" > "%al_o_node%.prj"

VOYAGER "%~dp0%~nx0" %args%
@rem TPPLUS "%~dp0%~nx0" %args%

@timeout 10 &goto:eof&::██████████████████████████████████████████████████████*/

print file="%al_o_link%.log", list='%al_1%',' ','@ali@',X(6.0)

RUN PGM=NETWORK PRNFILE=net2shp.prn MSG='net2shp'
;RUN PGM=CUBE
;function=SHAPE2NETWORK

FILEI NETI[1]= "%al_1%"
;FILEI GEOMI[1]="%al_1%.shp" ;Note that the GEOMI index is 1, even with LINKI[1] specified. The GEOMI data will be used as the geometry source.

FILEO LINKO  = "%al_o_link%.shp",
      FORMAT=SHP

FILEO NODEO = "%al_o_node%.shp",
      FORMAT=SHP
; FORMAT=SHP INCLUDE=A,B,DISTANCE

;phase=linkmerge
;   GEOMETRYSOURCE=1 ; # same as GEOMI

;MERGE RECORD=F

;PROCESS PHASE=INPUT FILEI=LI.2 ; invert A,B nodes for net2 
;_Temp = A
;    A = B
;    B = _Temp
;ENDPROCESS

;PROCESS PHASE=LINKMERGE
;GEOMETRYSOURCE=1
;If (LI.1.A = LI.2.A & LI.1.B = LI.2.B)
;    TwoWayVol = round(LI.1.VEHS24 + LI.2.VEHS24)
;    AMlanes = (LI.1.amlane + LI.2.amlane)
;Else
;    TwoWayVol = round(LI.1.VEHS24)
;    AMlanes = LI.1.amlane
;EndIf
;ENDPROCESS

ENDRUN
