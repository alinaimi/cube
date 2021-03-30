/*👩‍✈️
set @=%~f0&call "%~dp0cube-p" %*
@echo on &@color F3 &cls ? &&@title %~n0 (%*)        &::UU?????UU

@rem VOYAGER "%~dpnx0" %args%

@%ComSpec% /v /c "(set cs=%windir%\SysWoW64\cscript&&IF [%PROCESSOR_ARCHITECTURE%]==[x86] set cs=cscript)&&@%ComSpec% /v /c !cs! //nologo //e:javascript "%~f0" %*" &::x64 is missing alot of functions

@timeout 5&goto :eof ██🍵██*/

var incl = ["Link", "A", "B", "DISTANCE", "FTYPE", "TOLL", "TOLLGRP", "AMLANE", "AMLIMIT", "PMLANE", "PMLIMIT", "OPLANE", "OPLIMIT", "LINKID", "ATYPEOVER", "TAZ", "ATYPE"];//! list of fields to keep. useless: "SHAPE_LENG", 

fs = new ActiveXObject("Scripting.FileSystemObject");
try {
  var fs = new ActiveXObject("Scripting.FileSystemObject");
} catch (e) {
  var alib_jse = new ActiveXObject('WScript.Shell').ExpandEnvironmentStrings("%ALIB%")
  WScript.echo("ERROR " + e.number + ": " + e.description + " - while loading alib.jse (" + alib_jse + ")\n");
}

var sh = wsh = wshShell = WshShell = shell = oShell = objShell = WScript.CreateObject("WSCript.shell");
console = {
  log: function (s) {
    // if (s instanceof Object)
    // printObj(s, "");
    // else
    WScript.echo(s);
  },
  print: function (s) {
    console.log(s)
  }
}

__dirname = WScript.ScriptFullName.substring(0, WScript.ScriptFullName.lastIndexOf(WScript.ScriptName) - 1).replace(/\\/g, "/") + "/";
console.log("__dirname:  " + __dirname);

//!--- add missing "include" function for string
if (!String.prototype.includes) {
  String.prototype.includes = function (str) {
    return ((this.indexOf(str) !== -1) ? true : false);
  }
}

alib_root = __dirname.replace(/\\/g, "/");// + "/.."

var argc = WScript.Arguments.length;
var argv = [];
for (var i = 0; i < argc; i++)
  argv.push(WScript.Arguments(i)); //! copy args to argv

var fn_out = argv[0].split('.')[0] + "-clean.log";
// var myFileSysObj = new ActiveXObject("Scripting.FileSystemObject");
var myInputTextStream = fs.OpenTextFile(argv[0], 1, true);
var myOutputTextStream = fs.OpenTextFile(fn_out, 2, true);

var ln_num = 0;
while (!myInputTextStream.AtEndOfStream) {
  ln_num++;
  var ln_in = myInputTextStream.ReadLine();
  var ln_in = ln_in.replace(/;/g, ',');
  var ln_in = ln_in.replace(/[.][0-9]+/g, ''); //! remove decimals

  var ln_out = ln_in.split(',');
  if (ln_num == 1) {
    var ln_1 = ln_in.split(',');
    var n_col_node = ln_1[2];
    var n_col_link = ln_1[3];
    n_col_link = incl.length - 1;
    ln_1[3] = n_col_link;
    ln_out = ln_1.join();

  if (ln_num == 2) var ln_2 = ln_in.split(',');
  if (ln_num == 3) var ln_3 = ln_in.split(',');
  if (ln_num == 4) var ln_4 = ln_in.split(',');

  //!--- filter headers
  if (ln_num == 3) {
    var cols = ln_in.split(',');
    var arr = [];
    arr.push(0);//! N/L
    arr.push(1);//! A/C/D
    // arr.push(2);//! order (can be always 0)

    for (i = 0; i < cols.length; ++i)
      for (j = 0; j < incl.length; ++j) {
        if (cols[i] == incl[j]) {
          arr.push(i + 2); //! correct offset
          console.log(i + cols[i]);
        }
      }
    ln_out = incl.join();
  }

  //!--- output
  //! if NOT exists, A adds, C nags
  //! if     exists, A nags, C fixes
  if (ln_num >= 4) {
    var arr_out = [];

    if (ln_out[0] == 'N') {
      ln_out = ln_out.join();
    }

    if (ln_out[0] == 'L') {
      for (i = 0; i < arr.length; ++i) {
        arr_out.push(ln_out[arr[i]]);
      }
      ln_out = arr_out.join();
    }
  }

  //!--- Save
  //! Notes:
  //! only 1 blanc line at the EOF
  myOutputTextStream.WriteLine(ln_out);
}

console.log(arr);

myInputTextStream.Close();
myOutputTextStream.Close();
