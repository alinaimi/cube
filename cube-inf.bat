@rem @cls&@call "%~dp0cube-p" %*

::!--- Mat
@rem echo %~x1
@set is_mat=0
@set echo_inf=1
@if /i NOT [%~x1]==[.net] @set is_mat=1

@if /I [%is_mat%]==[1] goto :mat

:mat
@set str=
@set str1=
@set str2=
@rem echo "here is a string" | awk '{ split($0, chars, ""); for (i=1; i <= length($0); i++) { printf("%s\n", chars[i]); } }'
@rem @for /f "delims=" %%A in ('awk "{for (i=1;i<=10;i++) printf $i}" "%~f1" ^| sed -i "s/[\d128-\d255]//g"') do @(@set "str=%%A")
@rem @for /f "delims=" %%A in ('echo "here is a string" ^| awk -v FS="" "{for (i=1;i^<=NF;i++) printf $i}"') do @(@set "str=%%A")
@for /f "delims=" %%A in ('head -c 500 "%~f1" ^| strings -s ""') do @set "str=%%A"

@for /f "delims=" %%A in ('echo "%str%" ^| gawk -F "MVR" "/=/{printf $1;}" ^| gawk -F "PAR" "/=/{printf $2;}" ^| sed "s/\x27/,/g" ^| sed "s/\x22/,/g"') do @set "str1=%%A"
@for /f "delims=" %%A in ('echo "%str%" ^| gawk -F "MVR" "/=/{printf $2;}" ^| sed "s/=2/,/g" ^| sed "s/\x22//g"') do @set "str2=%%A"

@rem @echo ---mat
@rem awk 'NR==2{print substr^($0,0,100^)}' "%~f1" | awk -F '=' '/=/{for (i=0; i^<9; i++) printf i":[" $i "]--- "; print $NF}'
@rem awk '{print substr^($0,5,200^)}' "%~f1"
@rem awk '{print substr^($0,5,200^)}' "%~f1" | awk -F '=' '/=/{for ^(i=0; i^<9; i++^) printf i":[" $i "]--- "; print $NF}'
@rem @for /f "delims=" %%A in ('awk "{print substr($0,5,200)}" "%~f1" ^| gawk -F "MVR" "/=/{printf $2;}" ^| gawk -F "ROW" "/=/{printf $1;}" ^|gawk -F "=" "/=/{printf $5;}" ^| awk "{ print $1 }"') do @set "n_zone=%%A"

@for /f "delims=" %%A in ('echo "%str1%" ^| gawk -F "M=" "/=/{printf $2;}" ^| sed "s/\x22//g" ^| sed "s/ //g"') do @set "n_mat=%%A"

::!--- get n of matrices
@rem @for /f "delims=" %%A in ('echo "%str1%" ^| gawk -F "M=" "/=/{printf $1;}" ^| gawk -F "Zones=" "/=/{printf $2;}"') do set "n_zone=%%A"
@for /f "delims=" %%A in ('echo "%str1%" ^| awk -F"M=" '{print $1}' ^| awk -F"Zones=" '{print $2}' ^| sed "s/ //g"') do @set "n_zone=%%A"

::!--- get sheet names
@for /f "delims=" %%A in ('echo "%str2%" ^| sed "s/%n_mat%//" ^| sed "s/ //g" ^| sed "s/\x22//g" ^| sed "s/\(.*\),.*/\1/"') do @set "n_name=%%A"

@rem echo str: '%str%'
@rem @echo str1: %str1%
@rem @echo str2: %str2%
@rem @echo n_zone=%n_zone%
@rem @echo n_mat=%n_mat%
@rem @echo n_name=%n_name%
@rem @echo str1: %str1% 
@rem @echo str2: %str2%
@rem pause
@goto :hell


@rem gawk 'BEGIN{FS="\n";RS="";FPAT=".{,5}"} {for (i=1;i<=NF;i++){    printf("$%d = <%s>\n", i, $i)} }' ali.mat
::!--- Net
@if /I [%~x1]==[.net] @(
)
:net
@rem @echo ---net
@rem awk 'NR==2{print substr^($0,0,100^)}' "%~f1" | awk -F '=' '/=/{for (i=0; i^<9; i++) printf i":[" $i "]--- "; print $NF}'
@for /f "delims=" %%A in ('awk "NR==2{print substr($0,0,100)}" "%~f1" ^|gawk -F "=" "/=/{printf $3;}" ^| awk "{ print $1 }"') do @set "n_zone=%%A"
@for /f "delims=" %%A in ('awk "NR==2{print substr($0,0,100)}" "%~f1" ^|gawk -F "=" "/=/{printf $5;}" ^| awk "{ print $1 }"') do @set "n_link=%%A"
@for /f "delims=" %%A in ('awk "NR==2{print substr($0,0,100)}" "%~f1" ^|gawk -F "=" "/=/{printf $6;}" ^| awk "{ print $1 }"') do @set "n_rec=%%A"
@for /f "delims=" %%A in ('awk "NR==2{print substr($0,0,100)}" "%~f1" ^|gawk -F "=" "/=/{printf $4;}" ^| awk "{ print $1 }"') do @set "n_node=%%A"
@goto :hell


:hell
@goto :EOF
@if /I [%echo_inf%]==[1] (
  @if /I [%is_mat%]==[1] (
    @echo n_zone=%n_zone%
    @echo n_mat=%n_mat%
    @echo n_name=%n_name%
  )

  @if /I [%~x1]==[.net] @(
    @echo n_zone=%n_zone%
    @echo n_node=%n_node%
    @echo n_link=%n_link%
    @echo n_recs=%n_rec%
  )
)

@rem @pause
@goto :EOF
