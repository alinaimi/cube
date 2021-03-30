/*
set @=%~f0&call "%~dp0cube-p" %*
set zones=3722
set mtx=1
@set al_o=%~dpn1.plt.pdf
@echo --- THIS SCRIPT READS A MAT FILE ("%dpnx1%"), CREATE TWO MATRICS IN CSV AND DBF ("%al_o%")

start VOYAGER "%~dpnx0" %args%

@%SystemRoot%\System32\timeout 10 &goto:eof&::------------------------------------------------------------------------*/ %add2script%

; Sample Quickie plot with no parameters: draw links only
RUN PGM=NETWORK ; sample quick link plot
  NETI = "%dpnx1%"
  PLOTTER DEVICE = "Microsoft Print to PDF", FILE="%al_o%"
  DRAWLINK=0xffff
ENDRUN
