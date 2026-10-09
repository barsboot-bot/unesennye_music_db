@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

:: UNESENNYE MUSIC DB - Meta Generator (copy from servermod)
:: Author: KRa Tos (Константин) | v1.2.3

title Unesennye Music DB - Meta Generator
echo.
echo  UNESENNYE MUSIC DB META GENERATOR v1.2.3
echo  Author: KRa Tos (Константин)
echo.

set "MUSIC_ROOT=%~dp0..\sounds"

if not exist "%MUSIC_ROOT%" (
    set "MUSIC_ROOT=%~dp0sounds"
)

if not exist "%MUSIC_ROOT%" (
    echo [ERROR] sounds folder not found
    pause
    exit /b 1
)

echo [+] Root: %MUSIC_ROOT%
set /a PLAYLIST_COUNT=0
set /a TRACK_COUNT=0
set /a FILE_META_COUNT=0

if exist "%MUSIC_ROOT%\sd_playlists" (
    for /d %%D in ("%MUSIC_ROOT%\sd_playlists\*") do call :ProcessPlaylist "%%D"
)
if exist "%MUSIC_ROOT%\Type" (
    for /d %%D in ("%MUSIC_ROOT%\Type\*") do call :ProcessPlaylist "%%D"
)
if exist "%MUSIC_ROOT%\CD" (
    for /d %%D in ("%MUSIC_ROOT%\CD\*") do call :ProcessPlaylist "%%D"
)

echo.
echo  Playlists: !PLAYLIST_COUNT!  Tracks: !TRACK_COUNT!  File metas: !FILE_META_COUNT!
echo.
pause
exit /b 0

:ProcessPlaylist
set "FOLDER=%~1"
set "FOLDER_NAME=%~nx1"
set "META_FILE=%FOLDER%\meta.txt"
set "TRACKS="
set /a LOCAL_TRACKS=0
set /a INDEX=0

for %%F in ("%FOLDER%\*.ogg" "%FOLDER%\*.mp3" "%FOLDER%\*.wav") do (
    if exist "%%F" (
        set /a INDEX+=1
        set /a LOCAL_TRACKS+=1
        set /a TRACK_COUNT+=1
        set "FNAME=%%~nxF"
        set "FNAME_NO_EXT=%%~nF"
        set "FEXT=%%~xF"
        set "FSIZE=%%~zF"
        set "TRACKS=!TRACKS!!FNAME!,"
        set "FILE_META=%FOLDER%\!FNAME_NO_EXT!.meta"
        set "TRACK_DISPLAY=!FNAME_NO_EXT!"
        set "TRACK_DISPLAY=!TRACK_DISPLAY:_= !"
        set "TRACK_DISPLAY=!TRACK_DISPLAY:-= !"
        (
            echo name=!TRACK_DISPLAY!
            echo file=!FNAME!
            echo extension=!FEXT!
            echo index=!INDEX!
            echo playlist=%FOLDER_NAME%
            echo size_bytes=!FSIZE!
            echo generated_by=Unesennye generate_music_meta.bat v1.2.3
            echo author=KRa Tos (Константин)
        ) > "!FILE_META!"
        set /a FILE_META_COUNT+=1
    )
)

if !LOCAL_TRACKS! equ 0 exit /b 0
if defined TRACKS set "TRACKS=!TRACKS:~0,-1!"
set "DISPLAY_NAME=%FOLDER_NAME%"
set "DISPLAY_NAME=!DISPLAY_NAME:_= !"
(
    echo name=!DISPLAY_NAME!
    echo id=%FOLDER_NAME%
    echo tracks=!TRACKS!
    echo count=!LOCAL_TRACKS!
    echo generated_by=Unesennye generate_music_meta.bat v1.2.3
    echo author=KRa Tos (Константин)
) > "%META_FILE%"
set /a PLAYLIST_COUNT+=1
echo [+] %FOLDER_NAME% — !LOCAL_TRACKS! tracks
exit /b 0
