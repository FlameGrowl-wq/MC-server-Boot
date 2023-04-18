
@echo off
title boot menu
echo boot menu
:MENU_START
@echo off

cls
set INPUT=false
set "YN="
set "MENU_OP="
set "OP1_INPUT="
set "OP2_INPUT="
echo.					      [MC-Server-Boot-Menu]
echo.
echo.	[1]Boot		[2]make backups		[3]open editor	 [4]changelog 	[enter] exit
echo.				
echo.
echo.
echo.											   		     v.0.2.1
echo.													by FlameGrowl-wq
set /p MENU_OP=" "
IF %MENU_OP%==1 GOTO OP1
IF %MENU_OP%==2 GOTO OP2
IF %MENU_OP%==3 GOTO OP3
IF %MENU_OP%==4 GOTO OP4
IF %INPUT%==false GOTO DEFAULT

:OP2
cls
cd server
mkdir Backups
cd Backups
mkdir %date%
cd ..

powershell.exe Compress-Archive world world_%date%.zip
powershell.exe Compress-Archive world_nether world_nether_%date%.zip
powershell.exe Compress-Archive world_the_end world_the_end_%date%.zip
move world_%date%.zip Backups
move world_nether_%date%.zip Backups
move world_the_end_%date%.zip Backups
cd Backups
move world_%date%.zip %date%
move world_nether_%date%.zip %date%
move world_the_end_%date%.zip %date%
goto MENU_START

:OP1
cls
@echo off
set "acc="
echo Are you accepting the EULA?
echo.    [Y]       [N]
set /p acc= " "
IF %acc%==y goto accsept
IF %acc%==N goto MENU_START




:accsept
echo eula=true >> eula.txt
cls
goto start_server

:start_server
echo startting  server
chcp 65001 >nul & rem UniCode darstellen


  rem  erzeuge BackspaceCharakter
for /f "delims=;" %%. in ('"prompt $H; & for %%. in (nul) do call"') do (set "bkspc=%%.")

set "ASCII220=▄"
set "ASCII223=▄"

echo optimizing Server
for %%a in (%ASCII220% %ASCII223%) do (
    for /l %%b in (1,1,50) do (
        
          rem Trick schreiben  in die gleiche Zeile
        <nul set /p "=%%a%%a"||ver>nul
        

    )
      rem neue Zeile
    echo:
    echo:
    echo loading plugins

)

  <nul set /p "=%%a%%a"||ver>nul

<nul set /p "=.%bkspc%    starting..."||ver>nul


for /l %%b in (1,1,39) do (
    <nul set /p "=%bkspc%"||ver>nul

)
echo serching for errors
for %%c in (%ASCII220% %ASCII223%) do (
for /l %%d in (1,1,5) do (

    <nul set /p "=%%c%%c"||ver>nul
    timeout 1 > NUL
    
    )
)

echo.
echo.
echo clean
echo start
timeout 1 > NUL
cls
echo This script will keep your server running even after crashing!
title Minecraft WatchDog
:StartServer
start /wait java -Xmx5120M -jar PaperMC.jar -o true -nogui
echo (%time%) Server closed/crashed... restarting!
goto MENU_START
 
 :OP3
 cls
echo Loading python
for %%c in (%ASCII220% %ASCII223%) do (
for /l %%d in (1,1,50) do (

    <nul set /p "=%%c%%c"||ver>nul
    
    
    )
)

echo starting
for %%c in (%ASCII220% %ASCII223%) do (
for /l %%d in (1,1,5) do (

    <nul set /p "=%%c%%c"||ver>nul
   
    
    )
)

goto editor
:editor
cd editor
cd V.0.1
start editor.exe
goto MENU_START


:OP4
echo.     !fixed bugs
echo.     +Reworked the boot loader
echo.     +Reworked the editor
echo.     +Added EULA creating and accepting


timeout 5 > NUL
goto MENU_START
