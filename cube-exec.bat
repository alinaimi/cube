::! --- default values
set root=.
set scenar=2019_Final
set runbat=run_ModelSteps_2019_Final.bat
::! Environment variables for (multistep) distributed processing:
::! Environment variables for (intrastep) distributed processing:
::!     use MDP = t/f (for true or false)
::!     use IDP = t/f (for true or false)
::!     Number of subnodes:  1-3 => 3 subnodes and one main node = 4 nodes in total
set useIdp=t
set useMdp=t
::!!  AMsubnode & MDsubnode are used in highway_assignment_parallel.bat/s
set AMsubnode=1-4
set MDsubnode=2-4
::!!  subnode used in transit fare and transit assignment
::!!  We no longer use IDP in transit skimming, since it would require 16 cores
set subnode=1-3
set _iter_=i4

::! Run
"%ProgramW6432%\Citilabs\CubeVoyager\VOYAGER.EXE" "%~dpnx1" %args%

@timeout.exe 5
