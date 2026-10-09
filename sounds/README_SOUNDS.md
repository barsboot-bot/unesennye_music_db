# Звуки — ВАЖНО

Перед упаковкой мода положите сюда реальные аудиофайлы:

```
sounds/sd_playlists/01/track_01.ogg
sounds/sd_playlists/01/track_02.ogg
sounds/sd_playlists/02/track_01.ogg
```

В `config.cpp` путь указывается **без** расширения `.ogg`:

```
unesennye_music_db/sounds/sd_playlists/01/track_01
```

После добавления файлов запустите `tools/generate_music_meta.bat` — обновятся `.meta`, `meta.txt` и сниппет SoundSet.

Если добавляете новые ID плейлистов — допишите записи в `CfgSoundShaders` / `CfgSoundSets`.

**Автор:** KRa Tos (Константин)
