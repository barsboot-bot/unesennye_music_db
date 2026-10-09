@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

title Unesennye Meta + SoundSet Generator v1.3.0
echo UNESENNYE META + SOUNDSET GENERATOR v1.3.0
echo Author: KRa Tos (Константин)
echo.

set "MUSIC_ROOT=%~dp0..\sounds"
if not exist "%MUSIC_ROOT%" set "MUSIC_ROOT=%~dp0sounds"
if not exist "%MUSIC_ROOT%" (
  echo [ERROR] sounds folder not found
  pause
  exit /b 1
)

set "OUT_CFG=%~dp0generated_soundsets.txt"
echo // Auto-generated SoundShaders/SoundSets - paste into config.cpp > "%OUT_CFG%"
echo // Author: KRa Tos (Константин) >> "%OUT_CFG%"
echo. >> "%OUT_CFG%"

set /a PLAYLIST_COUNT=0
set /a TRACK_COUNT=0

if exist "%MUSIC_ROOT%\sd_playlists" for /d %%D in ("%MUSIC_ROOT%\sd_playlists\*") do call :ProcessPlaylist "%%D" sd
if exist "%MUSIC_ROOT%\Type" for /d %%D in ("%MUSIC_ROOT%\Type\*") do call :ProcessPlaylist "%%D" type
if exist "%MUSIC_ROOT%\CD" for /d %%D in ("%MUSIC_ROOT%\CD\*") do call :ProcessPlaylist "%%D" cd

echo.
echo Playlists: !PLAYLIST_COUNT! Tracks: !TRACK_COUNT!
echo SoundSet snippet: %OUT_CFG%
pause
exit /b 0

:ProcessPlaylist
set "FOLDER=%~1"
set "FOLDER_NAME=%~nx1"
set "META_FILE=%FOLDER%\meta.txt"
set "TRACKS="
set /a LOCAL=0
set /a INDEX=0

for %%F in ("%FOLDER%\*.ogg" "%FOLDER%\*.mp3" "%FOLDER%\*.wav") do (
  if exist "%%F" (
    set /a INDEX+=1
    set /a LOCAL+=1
    set /a TRACK_COUNT+=1
    set "FNAME=%%~nxF"
    set "FNAME_NO_EXT=%%~nF"
    set "FEXT=%%~xF"
    set "FSIZE=%%~zF"
    set "TRACKS=!TRACKS!!FNAME!,"
    set "FILE_META=%FOLDER%\!FNAME_NO_EXT!.meta"
    set "TRACK_DISPLAY=!FNAME_NO_EXT:_= !"
    (
      echo name=!TRACK_DISPLAY!
      echo file=!FNAME!
      echo extension=!FEXT!
      echo index=!INDEX!
      echo playlist=%FOLDER_NAME%
      echo size_bytes=!FSIZE!
      echo generated_by=Unesennye v1.3.0
      echo author=KRa Tos (Константин)
    ) > "!FILE_META!"

    rem SoundSet generation for numeric playlist folders
    set "IDPAD=%FOLDER_NAME%"
    if "!IDPAD:~1,1!"=="" set "IDPAD=0!IDPAD!"
    set "TPAD=!INDEX!"
    if !INDEX! LSS 10 set "TPAD=0!INDEX!"
    set "SHADER=Unesennye_SD_!IDPAD!_Track_!TPAD!_SoundShader"
    set "SSET=Unesennye_SD_!IDPAD!_Track_!TPAD!_SoundSet"
    echo class !SHADER! : Unesennye_Track_Base_SoundShader { samples[] = {{ "unesennye_music_db/sounds/sd_playlists/%FOLDER_NAME%/!FNAME_NO_EXT!", 1 }}; }; >> "%OUT_CFG%"
    echo class !SSET! : Unesennye_Track_Base_SoundSet { soundShaders[] = { "!SHADER!" }; }; >> "%OUT_CFG%"
  )
)

if !LOCAL! equ 0 exit /b 0
if defined TRACKS set "TRACKS=!TRACKS:~0,-1!"
(
  echo name=%FOLDER_NAME%
  echo id=%FOLDER_NAME%
  echo tracks=!TRACKS!
  echo count=!LOCAL!
  echo generated_by=Unesennye v1.3.0
  echo author=KRa Tos (Константин)
) > "%META_FILE%"
set /a PLAYLIST_COUNT+=1
echo [+] %FOLDER_NAME% — !LOCAL! tracks
exit /b 0
