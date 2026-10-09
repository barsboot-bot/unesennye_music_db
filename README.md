# UNESENNYE MUSIC DB v1.3.0

**Автор:** KRa Tos (Константин)

Мод с аудиофайлами и конфигами звуков для системы Unesennye.

## generate_music_meta.bat

Скрипт создаёт:

- `meta.txt` для каждого плейлиста
- `.meta` для каждого аудиофайла
- `tools/generated_soundsets.txt` — фрагмент для вставки в `config.cpp` (CfgSoundShaders / CfgSoundSets)

## Перед упаковкой в PBO

Положите реальные файлы:

```
sounds/sd_playlists/01/track_01.ogg
sounds/sd_playlists/01/track_02.ogg
```

Затем запустите `tools/generate_music_meta.bat`.

## Пути в config.cpp

DayZ ожидает путь **без** расширения `.ogg`:

```
unesennye_music_db/sounds/sd_playlists/01/track_01
```

При добавлении новых плейлистов допишите соответствующие `CfgSoundShaders` / `CfgSoundSets` (можно взять из `generated_soundsets.txt`).

**Автор:** KRa Tos (Константин)
