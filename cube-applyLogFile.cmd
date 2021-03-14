/*👩‍✈️
set @=%~n0&call "%~dp0cube-p" %*
@echo on &@color F3 &cls ? &&@title %~n0 (%*)        &::UU

@rem VOYAGER "%~dpnx0" %args%

@%ComSpec% /v /c "(set cs=%windir%\SysWoW64\cscript&&IF [%PROCESSOR_ARCHITECTURE%]==[x86] set cs=cscript)&&@%ComSpec% /v /c !cs! //nologo //e:javascript "%~f0" %*" &::x64 is missing alot of functions

@timeout 5&goto :eof ██🍵██*/

var sh = wsh = wshShell = WshShell = shell = oShell = objShell = WScript.CreateObject("WSCript.shell");

var argc = WScript.Arguments.length;
var argv = [];
for (var i = 0; i < argc; i++)
  argv.push(WScript.Arguments(i)); // copy args to argv

WScript.echo(sh.ExpandEnvironmentStrings("%pid_cube%"));
sendKey = SendKeys = press = function (str) {
  //! Key             Code
  //! --------------------
  //! {               {{}
  //! }               {}}
  //! [               {[}
  //! ]               {]}
  //! ~               {~}
  //! +               {+}
  //! ^               {^}
  //! %               {%}
  //! BACKSPACE       {BACKSPACE}, {BS}, or {BKSP}
  //! BREAK           {BREAK}
  //! CAPS LOCK       {CAPSLOCK}
  //! DEL or DELETE   {DELETE} or {DEL}
  //! DOWN ARROW      {DOWN}
  //! END             {END}
  //! ENTER           {ENTER} or ~
  //! ESC             {ESC}
  //! F1 through F16  {F1} through {F16}
  //! HELP            {HELP}
  //! HOME            {HOME}
  //! INS or INSERT   {INSERT} or {INS}
  //! LEFT ARROW      {LEFT}
  //! NUM LOCK        {NUMLOCK}
  //! PAGE DOWN       {PGDN}
  //! PAGE UP         {PGUP}
  //! PRINT SCREEN    {PRTSC}
  //! RIGHT ARROW     {RIGHT}
  //! SCROLL LOCK     {SCROLLLOCK}
  //! TAB             {TAB}
  //! UP ARROW        {UP}
  //! ---------------- prefixes:
  //! Key             Code
  //! +               SHIFT
  //! ^               CTRL
  //! %               ALT
  //! example: CTRL-ALT-DELETE : "^%{DELETE}"
  wsh.SendKeys(str);
}

sleep = wait = function (ms) {
  WScript.Sleep(ms)
}

console = {
  log: function (s) {
    if (s instanceof Object)
      WScript.echo(s); // call object handling
    else
      WScript.echo(s);
  },
  print: function (s) {
    console.log(s)
  }
}

//! Get ProcessID
var handle = sh.Exec("tasklist.exe");
while (!handle.StdOut.AtEndOfStream) {
  var p = handle.StdOut.ReadLine();
  p = p.replace(/  /g, " ").replace(/  /g, " ").replace(/  /g, " ").replace(/  /g, " ").replace(/  /g, " ");
  p = p.split(' ');
  //console.log(p[0])
  if (p[0] == 'CUBE.EXE') {
    var pid = p[1];
    console.log(pid);
  }
}
// clean up
handle = null;

var pid_cube = sh.ExpandEnvironmentStrings("%pid_cube%")
//console.log(pid_cube)

//!--- copy filename to clipboard
if (sh.AppActivate(pid_cube)) {
  SendKeys("%h"); SendKeys("p"); SendKeys("l"); SendKeys("2"); sleep(1000); // opens "Play Edit Log"
  var fn = argv[0].replace(/:/g, ":");
  console.log("applying : " + fn);
  SendKeys(fn); sleep(50); // paste .log file
  // SendKeys("^v"); // paste .log file
  SendKeys("{ENTER}"); sleep(500);
  SendKeys("y"); sleep(100); // y: apply only changed attributes (leave branched changes as is) / no: apply all the attributes in .log file (overwrites the branched ones, not desirable in most cases)
  SendKeys(" "); sleep(50); // do some confirming
  // WScript.Quit(0);
} else {
  WScript.Echo("Failed to find application with title: " + title);
  WScript.Quit(1);
}
