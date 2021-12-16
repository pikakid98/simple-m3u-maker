@ECHO OFF
;Title Simple M3U Maker (v2.1) [By Pikakid98]
IF EXIST "%tmp%\SM3UM-music.txt" (
GOTO Mus
) ELSE (
GOTO Main
)

IF EXIST "%tmp%\SM3UM-emu.txt" (
GOTO MTI
) ELSE (
GOTO Main
)


:Main
ECHO This tool can create an M3U playlist with either music or
ECHO a multi-track ISO file for emulators
ECHO.
ECHO Choose an option
ECHO.
ECHO 1. Music
ECHO 2. Multi-Track ISO For Emulation
ECHO.

CHOICE /C 12

IF ERRORLEVEL 2 GOTO MTI
IF ERRORLEVEL 1 GOTO Mus

::----------------------------------------------------------
:Mus
CLS
IF EXIST "%userprofile%\Downloads\M3U Maker" (
GOTO Mus-M3U
) ELSE (
GOTO Mus-Folder
)


:Mus-Folder
mkdir "%userprofile%\Downloads\M3U Maker"
echo msgbox "m3u Template Created. Drop your music here and rerun the .exe again" >> "%tmp%\msg.vbs"
START "" "%tmp%\msg.vbs"
echo This file is worthless > %tmp%\SM3UM-music.txt
start /wait "" %windir%\explorer.exe "%userprofile%\Downloads\M3U Maker"
del "%tmp%\msg.vbs"
exit


:Mus-M3U
IF EXIST "%userprofile%\Downloads\M3U Maker\Your M3U" (
GOTO Error
) ELSE (
GOTO Mus-M3U-1
)

:Mus-M3U-1
cd "%userprofile%\Downloads\M3U Maker"
dir /B > "%tmp%\album.m3u"
mkdir "Your M3U"
move "%tmp%\album.m3u" "Your M3U\album.m3u"
start /wait "" %windir%\explorer.exe "%userprofile%\Downloads\M3U Maker\Your M3U"
GOTO Cleanup
exit
::----------------------------------------------------------

::----------------------------------------------------------
:MTI
CLS
IF EXIST "%userprofile%\Downloads\M3U Maker" (
GOTO MTI-M3U
) ELSE (
GOTO MTI-Folder
)

:MTI-Folder
mkdir "%userprofile%\Downloads\M3U Maker"
echo msgbox "m3u Template Created. Drop your .cue track files here and rerun the .exe again (Please only use the .cue files as they are only what this tool looks for)" >> "%tmp%\msg.vbs"
START "" "%tmp%\msg.vbs"
echo This file is worthless > %tmp%\SM3UM-emu.txt
start /wait "" %windir%\explorer.exe "%userprofile%\Downloads\M3U Maker"
del "%tmp%\msg.vbs"
exit

:MTI-M3U
IF EXIST "%userprofile%\Downloads\M3U Maker\Your M3U" (
GOTO Error
) ELSE (
GOTO MTI-M3U-1
)

:MTI-M3U-1
cd "%userprofile%\Downloads\M3U Maker"
dir *.cue /B  > "%tmp%\iso.m3u"
mkdir "Your M3U"
move "%tmp%\iso.m3u" "Your M3U\iso.m3u"
start /wait "" %windir%\explorer.exe "%userprofile%\Downloads\M3U Maker\Your M3U"
GOTO Cleanup
exit

::----------------------------------------------------------
:Cleanup
del "%tmp%\SM3UM-emu.txt"
del "%tmp%\SM3UM-music.txt"
exit

:Error
echo msgbox "Oops!. An M3U has already been created here. Please clean the folder up first" >> "%tmp%\msg.vbs"
START "" "%tmp%\msg.vbs"
start /wait "" %windir%\explorer.exe "%userprofile%\Downloads\M3U Maker\Your M3U"
del "%tmp%\msg.vbs"
exit