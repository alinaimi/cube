/*
set @=%~f0&call "%~dp0cube-p" %*

@set al_o=%~dpn1.plt.pdf
@echo --- Plotting [%f1%] to ("%al_o%")

start VOYAGER "%~f0" %args%

@call "%~dp0cube-q" %*&goto:eof&::---*/ %add2script%

RUN PGM=NETWORK PRNFILE="%PRNFILE%"
  NETI = "%f1%"
  
  ;! SETUP Plotter
  PLOTTER {
    DEVICE="Microsoft Print to PDF"
    FILE="%al_o%"
    POSTLINKVAR=A,B,_AB,_STR
    FONT='COURIER',0.10,YELLOW,BOLD
    POST=AUTOSIZE(.05)
    POSTNODEVAR=A, FONT='COURIER',.10
    LINKOFFSET=0.01
    BANDWIDTH=_BANDWIDTH FILL=SOLID TAPER=45
    HEADER= "This is header 1",
    "This is header 2",
    align=center, font='courier' ,0.1,green
    FOOTER="Footer 1"
    FOOTER[3]="Footer 3"
    FOOTER[5]='Shows various date tokens: [date] [idate]'
    FOOTER[7]='Shows various time tokens: [time] [times]',
    FOOTER[7]='Shows window and scale tokens: [window] [scale]'
    align=right font='Courier',0.15,green
    LEGEND=TopLeft, font='courier',.10,blue,italics,
    LINE[1]=TL.LINE1,symbol=triangle,.15,red
    LINE[5]=tl.line5,symbol=Dash,.15,red
    LEGEND=TR, font='courier',.20,blue,italics,
    LINE[1]=TR.LINE1,symbol=triangle,.5,red
    LINE[3]=tr.TRne3,symbol=rectangle,.08,red
    LEGEND=3, font='courier',.10,red,italics,
    LINE[1]=BL.LINE1,symbol=circle,.10,red
    LINE[5]=BL.line5,symbol=dashdot,.15,red
    LEGEND=BottomRight font='courier',.15,purple,italics,
    LINE[2]=BR.LINE2,symbol=triangle,.15,red
  }
  
  ;! Plotting Controls
  if (a<=19 || b<=19) _BANDWIDTH = amlane/10
  _AB = A*100 + B
  _STR = str(_ab/100,5,2)
  DRAWLINK=RED,,SOLID, LINKPOST=GREEN
  IF (A.X == B.X || A.Y == B.Y) LINKPOST=BLUE;! FLAT|VERTICAL LINES
  DRAWA=BLUE,0.20,CIRCLE,YELLOW
  NODEPOST=r123b220g100,.1
  IF (A>=30 && A <40) LINK=GREEN,,DASH ;! reset the color of these links
  
  ;! set node postings and symbols
  IF (A<=5) DRAWA=RED,0.10,CIRCLE,WHITE NODEPOST=0XFF00FF
  IF (A>5 && A<=10) DRAWA=RED ,0.40 CIRCLE NODEPOST=G255
  IF (A>10 && A<20) DRAWA=R255,0.15,RECTANGLE,BLACK NODEPOST=R255
ENDRUN
