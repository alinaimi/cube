/*
@set get_inf=2
set @=%~f0&call "%~dp0cube-p" %*

set mat1_size=%n_mat%

%reset_rpt%
start VOYAGER "%~f0" %args%

@call "%~dp0cube-q" %*&goto:eof&::████████*/%add2script%

cmt01 = ' '
cmt02 = ' '
cmt03 = ' '
cmt04 = ' '
cmt05 = ' '
cmt06 = ' '
cmt07 = ' '
cmt08 = ' '
cmt09 = ' '
cmt10 = ' '
cmt11 = ' '
cmt12 = ' '
cmt13 = ' '
cmt14 = ' '
cmt15 = ' '
cmt16 = ' '
cmt17 = ' '
cmt18 = ' '
cmt19 = ' '
cmt20 = ' '
if ( %mat1_size% < 01 ) cmt01 = ';'
if ( %mat1_size% < 02 ) cmt02 = ';'
if ( %mat1_size% < 03 ) cmt03 = ';'
if ( %mat1_size% < 04 ) cmt04 = ';'
if ( %mat1_size% < 05 ) cmt05 = ';'
if ( %mat1_size% < 06 ) cmt06 = ';'
if ( %mat1_size% < 07 ) cmt07 = ';'
if ( %mat1_size% < 08 ) cmt08 = ';'
if ( %mat1_size% < 09 ) cmt09 = ';'
if ( %mat1_size% < 10 ) cmt10 = ';'
if ( %mat1_size% < 11 ) cmt11 = ';'
if ( %mat1_size% < 12 ) cmt12 = ';'
if ( %mat1_size% < 13 ) cmt13 = ';'
if ( %mat1_size% < 14 ) cmt14 = ';'
if ( %mat1_size% < 15 ) cmt15 = ';'
if ( %mat1_size% < 16 ) cmt16 = ';'
if ( %mat1_size% < 17 ) cmt17 = ';'
if ( %mat1_size% < 18 ) cmt18 = ';'
if ( %mat1_size% < 19 ) cmt19 = ';'
if ( %mat1_size% < 20 ) cmt20 = ';'

ucmt01 = ';'
ucmt02 = ';'
ucmt03 = ';'
ucmt04 = ';'
ucmt05 = ';'
ucmt06 = ';'
ucmt07 = ';'
ucmt08 = ';'
ucmt09 = ';'
ucmt10 = ';'
ucmt11 = ';'
ucmt12 = ';'
ucmt13 = ';'
ucmt14 = ';'
ucmt15 = ';'
ucmt16 = ';'
ucmt17 = ';'
ucmt18 = ';'
ucmt19 = ';'
ucmt20 = ';'
if ( %mat1_size% == 01 ) ucmt01 = ' '
if ( %mat1_size% == 02 ) ucmt02 = ' '
if ( %mat1_size% == 03 ) ucmt03 = ' '
if ( %mat1_size% == 04 ) ucmt04 = ' '
if ( %mat1_size% == 05 ) ucmt05 = ' '
if ( %mat1_size% == 06 ) ucmt06 = ' '
if ( %mat1_size% == 07 ) ucmt07 = ' '
if ( %mat1_size% == 08 ) ucmt08 = ' '
if ( %mat1_size% == 09 ) ucmt09 = ' '
if ( %mat1_size% == 10 ) ucmt10 = ' '
if ( %mat1_size% == 11 ) ucmt11 = ' '
if ( %mat1_size% == 12 ) ucmt12 = ' '
if ( %mat1_size% == 13 ) ucmt13 = ' '
if ( %mat1_size% == 14 ) ucmt14 = ' '
if ( %mat1_size% == 15 ) ucmt15 = ' '
if ( %mat1_size% == 16 ) ucmt16 = ' '
if ( %mat1_size% == 17 ) ucmt17 = ' '
if ( %mat1_size% == 18 ) ucmt18 = ' '
if ( %mat1_size% == 19 ) ucmt19 = ' '
if ( %mat1_size% == 20 ) ucmt20 = ' '
;print LIST=@cmt01@
