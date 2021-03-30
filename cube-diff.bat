/*
set @=%~f0&call "%~dp0cube-p" %*

::!--- 1) extract headers
call "%~dp0cube-ext-hdr.bat" %*

::!--- 2) generate diff cube script from headers
cscript //nologo //e:javascript "%~dpnx0" "%dp1%workdir\%n1%-%hdr.csv" %*

::!--- 3) exec diff cube script
@echo --- %n2% - %n1% (main remains %n1%)
VOYAGER "%dp1%workdir\cube-diff.s" %args%

@%SystemRoot%\System32\timeout 10 &goto:EOF &::████████*/ %add2script%

////!--- 2) generate diff cube script from headers
//GOTO EOF ;//███████ JScript */

var fso = new ActiveXObject("Scripting.FileSystemObject");
var fn_hdr = WScript.arguments(0);
WScript.echo("Getting headers from: " + fn_hdr );
fs = fso.OpenTextFile(fn_hdr, ForReading = 1);
s = fs.ReadLine();
fs.Close();
a = s.split(",");

var excl = [ "PROJECTID", "TMC1", "TMC2", "TMC3", "TMC4", "TMC5", "DIRLETTER", "STATIONID"];

fs2 = fso.OpenTextFile("workdir\\cube-diff.s", ForWriting = 2, true);
fs2.WriteLine('RUN PGM=NETWORK\n');
fs2.WriteLine('FILEI NETI[1] = "%dpnx1%"');
fs2.WriteLine('FILEI NETI[2] = "%dpnx2%"');
fs2.WriteLine('FILEO NETO = "%dp2%%parent2%-%n2%-minus-%parent1%-%n1%(kept).NET"\n');

fs2.WriteLine('\n;!--- Subtract');
for (i in a) {
  var s = a[i];
  var exc = false;
  for (x in excl)
    if (s == excl[x])
      exc = true;

  if (!exc) {
    fs2.WriteLine("s_" + s + " = LI.2." + s + " - LI.1." + s);
  }
}

fs2.WriteLine("\n;!--- Div");
for (i in a) {
  var s = a[i];
  var exc = false;
  for (x in excl)
    if (s == excl[x])
      exc = true;

  if (!exc) {
    fs2.WriteLine("if (" + "LI.1." + s + " != 0)\n  d_" + s + " = LI.2." + s + " / LI.1." + s + "\nelse\n  d_" + s + " = 1\nENDIF\n");
  }
}

fs2.WriteLine("\nENDRUN");
fs2.Close();

//:EOF
