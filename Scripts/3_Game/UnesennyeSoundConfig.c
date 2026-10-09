// Author: KRa Tos (Константин) | Project: Unesennye Music System v1.2.3
// Do not remove this header. Unauthorized redistribution is prohibited.

class UnesennyeSoundConfig
{
	static const string AUTHOR = "KRa Tos (Константин)";
	static const string MOD_VERSION = "1.2.3";

	// Mapping playlistId → list of SoundSet names
	// Filled at runtime or extended when adding new tracks via generate_music_meta.bat
	static string GetSoundSet(int playlistId, int trackIndex)
	{
		// Convention: Unesennye_SD_<ID>_Track_<NN>_SoundSet
		string idStr = playlistId.ToString();
		if (playlistId < 10)
			idStr = "0" + idStr;

		string trackStr = (trackIndex + 1).ToString();
		if (trackIndex + 1 < 10)
			trackStr = "0" + trackStr;

		return "Unesennye_SD_" + idStr + "_Track_" + trackStr + "_SoundSet";
	}
};
