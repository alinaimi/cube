/*👩‍✈️
set @=%~f0&call "%~dp0cube-p" %*
@echo on &@color F3 &cls ? &&@title %~n0 (%*)        &::UU?????UU

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

var restore_polygon_id = 4;
if (!isNaN(argv[1])) {
  restore_polygon_id = argv[1];
}

if (sh.AppActivate(pid_cube)) {
  SendKeys("%d"); SendKeys("r"); SendKeys(restore_polygon_id); sleep(100); // restore polygon 4
  SendKeys("%d"); SendKeys("sax"); sleep(2000); // open save dialog

  // subarea network file name
  var fn = argv[0].replace(/:/g, ":");
  fn = fn.replace(/\.net/g, "-ext.net");
  console.log("applying : " + fn);
  SendKeys(fn); sleep(50);
  // SendKeys("^v");
  SendKeys("{ENTER}"); sleep(500);// open subarea extraction dialog
  SendKeys("{ENTER}"); sleep(500);// Accept default renumbering pattern in subarea extraction dialog

  // SendKeys("y"); sleep(100); // y: apply only changed attributes (leave branched changes as is) / no: apply all the attributes in .log file (overwrites the branched ones, not desirable in most cases)

  //!--- do some confirming
  for (var i = 1; i < 10; i++) {
    //   SendKeys(" ");
    sleep(50);
  }

  // WScript.Quit(0);
} else {
  WScript.Echo("Failed to find application with title: " + title);
  WScript.Quit(1);
}
