@set @_=0/*&@set @=%~f0&::!!==👩‍✈️

@call "%~dp0cube-p" %*

@echo --- Open od.mat file and network file in front, then use this script
@rem VOYAGER "%~dpnx0" %args%

@%ComSpec% /v /c "(set cs=%windir%\SysWoW64\cscript&&IF [%PROCESSOR_ARCHITECTURE%]==[x86] set cs=cscript)&&@%ComSpec% /v /c !cs! //nologo //e:javascript "%~f0" %*" &::x64 is missing alot of functions

@call "%~dp0alib/alib.cmd" %*&@%SystemRoot%\System32\timeout 3 &@goto:eof&::!==🍵*/

var pid_cube = sh.ExpandEnvironmentStrings("%pid_cube%"); //! get from cube-p
//console.log(pid_cube)

key = function (key_code) {
  SendKeys(key_code);
  sleep(20);
}

if (sh.AppActivate(pid_cube)) {
  var fn = argv[0].replace(/:/g, ":").replace(".net", "");

  SendKeys("%a"); SendKeys("l"); SendKeys("e"); sleep(1500); // Set linkage to matrices
  // SendKeys(fn+"-link.shp");
  key("{TAB}"); key("{LEFT}"); key("{ENTER}"); key("{LEFT}"); key("{ENTER}"); key("{LEFT}"); key("{ENTER}"); key("{LEFT}"); key("{ENTER}"); key("{TAB}"); key("{ENTER}"); // add all
  sleep(5000); //! wait4 redraw
  SendKeys("%a"); SendKeys("d"); //! open desire lines
  sleep(1000);
  SendKeys('^+{F10}');  key("{DOWN}"); key("{ENTER}"); //key("M1.T5.AMTR") //SendKeys.SendWait("{RWIN}"); // SendKeys.SendWait("\+({F10})"); //add matrix . The parentheses indicates that F10 should be pressed while Shift is held down.
  key("{TAB}"); key("{TAB}"); key("{TAB}"); key("{TAB}"); key("{TAB}"); key("{TAB}"); key("{TAB}"); key("{TAB}"); key("N=5845-5996"); // o
  key("{TAB}"); key("N=5845-5996"); // key("N=3675-3722"); //! D
  key("{TAB}"); key("{TAB}"); key("50"); // scale
  key("{TAB}"); key("{TAB}"); key(" "); // Display
  // for (var i = 1; i < 3; i++) 
  //   SendKeys("{DOWN}");

  // SendKeys("{ENTER}");SendKeys("{ENTER}");
  
  sleep(1000);

  //!--- do some confirming
  for (var i = 1; i < 10; i++) {
    //   SendKeys(" ");
    sleep(50);
  }

  // WScript.Quit(0);
} else {
  WScript.Echo("Failed to find CUBE.EXE");
  WScript.Quit(1);
}
