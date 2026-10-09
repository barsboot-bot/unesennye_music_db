// Author: KRa Tos (Константин) | Project: Unesennye Music System v1.2.3
// Do not remove this header. Unauthorized redistribution is prohibited.

class CfgPatches
{
	class unesennye_music_db
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"DZ_Data"};
	};
};

class CfgMods
{
	class unesennye_music_db
	{
		dir = "unesennye_music_db";
		picture = "";
		action = "";
		hideName = 0;
		hidePicture = 1;
		name = "Unesennye Music DB";
		credits = "KRa Tos (Константин)";
		author = "KRa Tos (Константин)";
		authorID = "";
		version = "1.2.3";
		extra = 0;
		type = "mod";
		dependencies[] = {"Game"};

		class defs
		{
			class gameScriptModule
			{
				value = "";
				files[] = {"unesennye_music_db/Scripts/3_Game"};
			};
		};
	};
};

// ==================== SOUND SHADERS / SETS ====================
// Placeholder entries. Replace paths with real .ogg from sounds/ folder.
class CfgSoundShaders
{
	class Unesennye_Track_Base_SoundShader
	{
		samples[] = {{ "unesennye_music_db\sounds\placeholder", 1 }};
		volume = 1.0;
		range = 150;
		rangeCurve = "defaultMusicCurve";
	};

	class Unesennye_SD_01_Track_01_SoundShader : Unesennye_Track_Base_SoundShader
	{
		samples[] = {{ "unesennye_music_db\sounds\sd_playlists\01\track_01", 1 }};
	};
	class Unesennye_SD_01_Track_02_SoundShader : Unesennye_Track_Base_SoundShader
	{
		samples[] = {{ "unesennye_music_db\sounds\sd_playlists\01\track_02", 1 }};
	};
};

class CfgSoundSets
{
	class Unesennye_Track_Base_SoundSet
	{
		soundShaders[] = { "Unesennye_Track_Base_SoundShader" };
		volumeFactor = 1.0;
		spatial = 1;
		doppler = 0;
		loop = 0;
	};

	class Unesennye_SD_01_Track_01_SoundSet : Unesennye_Track_Base_SoundSet
	{
		soundShaders[] = { "Unesennye_SD_01_Track_01_SoundShader" };
	};
	class Unesennye_SD_01_Track_02_SoundSet : Unesennye_Track_Base_SoundSet
	{
		soundShaders[] = { "Unesennye_SD_01_Track_02_SoundShader" };
	};
};
