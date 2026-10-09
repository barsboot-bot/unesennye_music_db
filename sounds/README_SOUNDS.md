# Sounds folder

Place your `.ogg` (recommended) files here.

## Structure for SD Cards

```
sounds/
  sd_playlists/
    01/
      track_01.ogg
      track_01.meta
      track_02.ogg
      track_02.meta
      meta.txt
    02/
      ...
```

## Structure for Type / CD

```
sounds/
  Type/
    Rock_80s/
      song1.ogg
      song1.meta
      meta.txt
  CD/
    Classic/
      ...
```

After adding files run `tools/generate_music_meta.bat` from the servermod repository
(or copy the bat here) to regenerate all `.meta` and `meta.txt`.

Then add corresponding CfgSoundShaders / CfgSoundSets entries in config.cpp
(or use a build script that generates them).
