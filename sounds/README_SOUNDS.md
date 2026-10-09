# Sounds — IMPORTANT

You must place real audio files here before packaging:

```
sounds/sd_playlists/01/track_01.ogg
sounds/sd_playlists/01/track_02.ogg
sounds/sd_playlists/02/track_01.ogg
```

DayZ expects the path in config **without** the `.ogg` extension:
`unesennye_music_db/sounds/sd_playlists/01/track_01`

After adding files, run `tools/generate_music_meta.bat` to refresh `.meta` and `meta.txt`.

Then add matching CfgSoundShaders / CfgSoundSets entries in config.cpp if you add new playlist IDs.

**Author:** KRa Tos (Константин)
