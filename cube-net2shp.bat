/*
set @=%~f0 &call "%~dp0cube-p" %*

@set crs=PROJCS["NAD_1983_StatePlane_Maryland_FIPS_1900_Feet",GEOGCS["GCS_North_American_1983",DATUM["D_North_American_1983",SPHEROID["GRS_1980",6378137.0,298.257222101]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]],PROJECTION["Lambert_Conformal_Conic"],PARAMETER["False_Easting",1312333.33333333],PARAMETER["False_Northing",0.0],PARAMETER["Central_Meridian",-77.0],PARAMETER["Standard_Parallel_1",38.3],PARAMETER["Standard_Parallel_2",39.45],PARAMETER["Latitude_Of_Origin",37.6666666666667],UNIT["US survey foot",0.304800609601219]]
echo %crs%>"%dpn1%-link.prj" &type "%dpn1%-link.prj" > "%dpn1%-node.prj"

VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::██████████████████████████████████████████████████████*/

print file="%dp1%\workdir\%@%-%n1%%x1%-%dt%.log", list='%dpnx1%',' ','@ali@',X(6.0)

RUN PGM=NETWORK
  FILEI LINKI[1]= "%dpnx1%"
  ;FILEI GEOMI[1]="%dpnx1%.shp" ;Note that the GEOMI index is 1, even with LINKI[1] specified. The GEOMI data will be used as the geometry source.

  FILEO LINKO  = "%dpn1%-link.shp",
      FORMAT=SHP

  FILEO NODEO = "%dpn1%-node.shp",
      FORMAT=SHP

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
