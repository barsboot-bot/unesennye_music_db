# UNESENNYE MUSIC DB v1.2.3

**Author:** KRa Tos (Константин)  
**Version:** 1.2.3

Публичная база музыки для системы Unesennye.

## Структура

```
@unesennye_music_db/
├── mod.cpp
├── config.cpp          ← CfgSoundShaders / CfgSoundSets
├── Scripts/
│   └── 3_Game/
│       └── UnesennyeSoundConfig.c
├── sounds/
│   ├── sd_playlists/
│   │   └── 01/
│   │       ├── track_01.ogg   ← положите свои файлы
│   │       ├── track_01.meta
│   │       └── meta.txt
│   ├── Type/
│   └── CD/
└── tools/
    └── generate_music_meta.bat
```

## Добавление музыки

1. Скопируйте `.ogg` в `sounds/sd_playlists/01/` (или Type/CD).
2. Запустите `tools\generate_music_meta.bat`.
3. Добавьте соответствующие `CfgSoundShaders` / `CfgSoundSets` в `config.cpp` (или расширьте скрипт генерации).
4. Перепакуйте PBO.

## Author

**KRa Tos (Константин)**
