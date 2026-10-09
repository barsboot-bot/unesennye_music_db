// Author: KRa Tos (Константин) | Project: Unesennye Music System v1.2.4
// Do not remove this header. Unauthorized redistribution is prohibited.

class UnesennyeSoundConfig
{
	static const string AUTHOR = "KRa Tos (Константин)";
	static const string MOD_VERSION = "1.2.4";

	static string GetSoundSet(int playlistId, int trackIndex)
	{
		string idStr = playlistId.ToString();
		if (playlistId < 10)
			idStr = "0" + idStr;

		int n = trackIndex + 1;
		string trackStr = n.ToString();
		if (n < 10)
			trackStr = "0" + trackStr;

		return "Unesennye_SD_" + idStr + "_Track_" + trackStr + "_SoundSet";
	}
};
