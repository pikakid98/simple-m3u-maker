@ECHO OFF
IF EXIST "%userprofile%\Downloads\M3U Maker" (
GOTO M3U
) ELSE (
GOTO Folder
)


:Folder
mkdir "%userprofile%\Downloads\M3U Maker"
echo msgbox "m3u Template Created. Drop your music here and rerun the .exe again" >> "%tmp%\msg.vbs"
START "" "%tmp%\msg.vbs"
start /wait "" %windir%\explorer.exe "%userprofile%\Downloads\M3U Maker"
del "%tmp%\msg.vbs"
exit


:M3U
IF EXIST "%userprofile%\Downloads\M3U Maker\Your M3U" (
GOTO M3U-2
) ELSE (
GOTO M3U-1
)

:M3U-1
cd "%userprofile%\Downloads\M3U Maker"
dir /B > "%tmp%\album.m3u"
mkdir "Your M3U"
move "%tmp%\album.m3u" "Your M3U\album.m3u"
start /wait "" %windir%\explorer.exe "%userprofile%\Downloads\M3U Maker\Your M3U"
exit

:M3U-2
echo msgbox "Oops!. An M3U has already been created here. Please clean the folder up first" >> "%tmp%\msg.vbs"
START "" "%tmp%\msg.vbs"
start /wait "" %windir%\explorer.exe "%userprofile%\Downloads\M3U Maker\Your M3U"
del "%tmp%\msg.vbs"
exit