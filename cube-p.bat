::! dissagregate file name. i.e.: @:[C:/users/ali.txt] @_div:[C:] @_pth:[/users/] @_nam:[ali] @_ext:[.txt]
::! @:[C:\Windows\ali.txt] @d:[C:] @p:[\Windows\] @n:[ali] @x:[.txt]
@for %%i in ("%@%") do @(
  @set @d=%%~di
  @set @p=%%~pi
  @set @n=%%~ni
  @set @x=%%~xi

  @set @_drv=%%~di
  @set @_pth=%%~pi
  @set @_nam=%%~ni
  @rem @set @_nam_=%@_nam:~4,99%
  @set @_ext=%%~xi
)
@set @_nam_=%@_nam:~5,99%
@set @x_=%@x:.=%&@echo on &@color 3F &@title %@_nam% [%*] &@cls/&@echo -- %@_nam% "%*"

::!--- setting up the paths
@set path=
@rem @setlocal EnableDelayedExpansion :: cause path doesn't transfer to other bash files
@set p=%ProgramW6432%\Citilabs\CubeVoyager
@PATH %p%;%ProgramFiles(x86)%\Citilabs\CubeVoyager;%PATH%
@PATH %ProgramFiles(x86)%\Citilabs\Cube;%PATH%
@echo %path%|%SystemRoot%\System32\find /i "%SystemRoot%\System32"                   >nul||@path %SystemRoot%\System32;%SystemRoot%\System32\wbem;%path%
@echo %path%|%SystemRoot%\System32\find /i      "%ProgramW6432%\Citilabs\CubeVoyager">nul||@path      %ProgramW6432%\Citilabs\CubeVoyager;%path%
@echo %path%|%SystemRoot%\System32\find /i "%ProgramFiles(x86)%\Citilabs\CubeVoyager">nul||@path %ProgramFiles(x86)%\Citilabs\CubeVoyager;%path%

@for /f "tokens=2" %%a in ('tasklist^|find /i "cube.exe"') do @(@set pid_cube=%%a)

@rem setlocal
@if NOT [%1]==[] @(
  @cd/d "%~dp1"
  @set parent1=%~dp1
  @for %%a in ("%1") do @for %%b in ("%%~dpa\.") do @set "parent1_n=%%~nxb"

  @for %%a in ("%parent1:~0,-1%") do @(
    @for %%b in ("%%~dpa\.") do @set "grandparent1_n=%%~nxb"
  )
)
@if NOT [%2]==[] @(
  @set parent2=%~dp2
  @for %%a in ("%2") do @for %%b in ("%%~dpa\.") do @set "parent2_n=%%~nxb"

  @for %%a in ("%parent2:~0,-1%") do @(
    @for %%b in ("%%~dpa\.") do @set "grandparent2_n=%%~nxb"
  )
)

@set wd=%~dp1workdir
@if [%1]==[] @set wd=%~dp0workdir
@if NOT EXIST "%wd%" (@md "%wd%")
@set reset_rpt=@if EXIST "%wd%\TPPL.PRJ" (@del /a /f /q "%wd%\TPPL.PRJ") &::! to prevent resetting the counter

::!--- Getting Local Date/Time
@rem @call dt
@rem %COMMANDER_PATH%\addon\aLieN\Windows\date.exe +"%Y-%m-%d"
@for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do @set "dt=%%a"
@set "yy=%dt:~2,2%" &@set "yyyy=%dt:~0,4%" &@set "mo=%dt:~4,2%" &@set "dd=%dt:~6,2%"
@set "hh=%dt:~8,2%" &@set  "mm=%dt:~10,2%" &@set "ss=%dt:~12,2%"
@set  dt=%yyyy%-%mo%-%dd%T%hh%%mm%%ss%
@set dt_=%yyyy%-%mo%-%dd%-%hh%%mm%%ss%
@set dt2=%yyyy%-%mo%-%dd%-%hh%-%mm%-%ss%

::!--- arguments
@set f0=%~f0
@set f1=%~f1
@set f2=%~f2
@set f3=%~f3
@set f4=%~f4
@set f5=%~f5
@set f6=%~f6
@set f7=%~f7
@set f8=%~f8
@set f9=%~f9

@set d0=%~d0
@set d1=%~d1
@set d2=%~d2
@set d3=%~d3
@set d4=%~d4
@set d5=%~d5
@set d6=%~d6
@set d7=%~d7
@set d8=%~d8
@set d9=%~d9

@set p0=%~p0
@set p1=%~p1
@set p2=%~p2
@set p3=%~p3
@set p4=%~p4
@set p5=%~p5
@set p6=%~p6
@set p7=%~p7
@set p8=%~p8
@set p9=%~p9

@set n0=%~n0
@set n1=%~n1
@set n2=%~n2
@set n3=%~n3
@set n4=%~n4
@set n5=%~n5
@set n6=%~n6
@set n7=%~n7
@set n8=%~n8
@set n9=%~n9

@set x0=%~x0
@set x1=%~x1
@set x2=%~x2
@set x3=%~x3
@set x4=%~x4
@set x5=%~x5
@set x6=%~x6
@set x7=%~x7
@set x8=%~x8
@set x9=%~x9

@set "x0_=%x0:.=%"
@set "x1_=%x1:~1%"
@set "x2_=%x2:~1%"
@set "x3_=%x3:~1%"
@set "x4_=%x4:~1%"
@set "x5_=%x5:~1%"
@set "x6_=%x6:~1%"
@set "x7_=%x7:~1%"
@set "x8_=%x8:~1%"
@set "x9_=%x9:~1%"

@set nx0=%~nx0
@set nx1=%~nx1
@set nx2=%~nx2
@set nx3=%~nx3
@set nx4=%~nx4
@set nx5=%~nx5
@set nx6=%~nx6
@set nx7=%~nx7
@set nx8=%~nx8
@set nx9=%~nx9

@set arg0=%0
@set arg1=%1
@set arg2=%2
@set arg3=%3
@set arg4=%4
@set arg5=%5
@set arg6=%6
@set arg7=%7
@set arg8=%8
@set arg9=%9

@set dp0=%~dp0
@set dp1=%~dp1
@set dp2=%~dp2
@set dp3=%~dp3
@set dp4=%~dp4
@set dp5=%~dp5
@set dp6=%~dp6
@set dp7=%~dp7
@set dp8=%~dp8
@set dp9=%~dp9

@set dpn0=%~dpn0
@set dpn1=%~dpn1
@set dpn2=%~dpn2
@set dpn3=%~dpn3
@set dpn4=%~dpn4
@set dpn5=%~dpn5
@set dpn6=%~dpn6
@set dpn7=%~dpn7
@set dpn8=%~dpn8
@set dpn9=%~dpn9

@set dpnx0=%~dpnx0
@set dpnx1=%~dpnx1
@set dpnx2=%~dpnx2
@set dpnx3=%~dpnx3
@set dpnx4=%~dpnx4
@set dpnx5=%~dpnx5
@set dpnx6=%~dpnx6
@set dpnx7=%~dpnx7
@set dpnx8=%~dpnx8
@set dpnx9=%~dpnx9

@for %%i in ("%~dp0\.") do @set "parent0=%%~nxi"
@for %%i in ("%~dp1\.") do @set "parent1_n=%%~nxi"
@for %%i in ("%~dp2\.") do @set "parent2_n=%%~nxi"
@for %%i in ("%~dp3\.") do @set "parent3=%%~nxi"
@for %%i in ("%~dp4\.") do @set "parent4=%%~nxi"
@for %%i in ("%~dp5\.") do @set "parent5=%%~nxi"
@for %%i in ("%~dp6\.") do @set "parent6=%%~nxi"
@for %%i in ("%~dp7\.") do @set "parent7=%%~nxi"
@for %%i in ("%~dp8\.") do @set "parent8=%%~nxi"
@for %%i in ("%~dp9\.") do @set "parent9=%%~nxi"

::!--- extras
@set PRNFILE=%dp1%workdir\%@%-%n1%%x1%-%dt%.prn
@rem @set HideScript=/HideScript
@set pppp=%@:~5,4%
@set Ppppp=-P%pppp%
@set page=-PH:32767 -PW:255
@set args=%Ppppp% %page% /Command /CloseWhenDone /Minimize /NoSplash /Start %HideScript% /High -Sworkdir "%wd%" -S"%wd%"
@set add2script=pageheight=32767

@goto :eof &::! --- CLI parameters:
Voyager.exe scriptfile [-Ppppp] [-PH:pageheight] [-PW:pagewidth] [-Sworkdir] [-Irunid] [/Start] [/StartTime:hhmm] [/EmailOn] [/NotifyOn] [/ViewPrint] [/Hide] [/High] [/Wait] [/WinLeft:xx] [/WinTop:xx] [/WinWidth:xx] [/WinHeight:xx]

Command line parameters:

• scriptfile is the name of the file that contains the Cube Voyager script control statements. The name may have a complete path in the typical operating system format. This file may be in a different subdirectory than the -Spath argument. In some operating environments (such as Windows), it may be necessary to provide a fully qualified file name (path\filename).

• pppp is a prefix (or project) that is pertinent to this application. Some files will always contain these characters (maximum 4 characters) as part of their name. Most individual programs will allow the prefix to be substituted directly for the ? character in their file names. The characters must be those that are acceptable as part of filenames to the operating system, and are not a Cube Voyager operator ('",+-*/&|). The program will generate a print file and a var file with this prefix as its first characters. If the prefix is not designated, the program will assign one based upon the following criteria:

If there is a pppp.PRJ file in the working subdirectory: the prefix will be set to the last prefix in the file. If there is no pppp.PRJ, it will generate a file by that name. Warning: Be sure that any pppp.PRJ file that Cube Voyager reads is a valid Cube Voyager PRJ file.

The program automatically associates a unique sequence number with the prefix.

The pageht, pagewdth, and runid parameters can be reset dynamically by Cube Voyager control statements within individual Cube Voyager programs. When set within the individual programs, their effect may be valid for only that program.

• pageht is the height (number of print lines) for a printed page of output. This will default to 58, if the program can not find a height from the Cube Voyager PRJ file. The maximum value is 32767.

• pagewdth is the maximum length a printed line can have. Itmay not be less than 72, nor greater than 255. If it is not specified, and a width can not be found from the Cube Voyager PRJ file, it will default to 132. Note that pagewdth will not cause longer length lines to be truncated or folded; they will be written with the appropriate length. The primary use of pagewdth is to assist in formatting messages and reports.

• workdir is the subdirectory that the application is to be run from. Normally, the user will log onto the desired subdirectory, and workdir will not need to be specified. But, in some operating environments, it may not be possible to log on to a subdirectory before starting the program. (Windows may cause some problems in this area.) When the program starts, it checks if workdir is specified, and if so, changes to that subdirectory before it processes the other arguments (excluding filename).

• runid can be used to specify a starting ID for the application. If ID is not specified, it will try to obtain a starting ID from the Cube Voyager PRJ file with matching prefix.

Command line options:

• /Startfor example to auto start the run, also auto terminatewhen done unless /ViewPrint is on
• /StartTime:hhmm to auto start the run at certain time
• /EmailOn to set Email check box on
• /NotifyOn to set notify on check box
• /ViewPrint to automatically bring up print file
• /HideScript to exclude the contents of the script from the Print file
• /Hide to hide the run dialog box completely when starting if auto start on
• /High to set the high priority check box
• /Wait to auto start in Wait Start mode as a cluster node
• /WinLeft:xx to set the window location and width/height or to restore screen size and position when restart from Wait Start mode
• /WinTop:xx
• /WinWidth:xx
• /WinHeight:xx

As the Cube Voyager job is executing, periodic messages will be written to the Cube Voyager run dialog if /Hide is not on. Pressing Ctrl-Break can be normally used to prematurely terminate the run if the run dialog has been hidden. Otherwise, the Abort button on the Cube Voyager run dialog can be used. When the Cube Voyager job is completed, control will return to the windows command line interpreter.


::!--- misc
/DEBUG
/DEBUGCT
/LANGUAGEEXTRACT option can only be done in Admin mode or in a non-protected folder
/COMMAND
/CLOSEWHENDONE
/MINIMIZE
/XY
/PT
/JD
/JB
/HP
/PP
/CT
/SH
/DW 
STARTHIDE
HIDESCRIPT
LIST
CLOSE
EXIT
START
Hide
