extends Node

var config = ConfigFile.new()
const Settings_File_Path = "user://settings.ini"


func _ready() -> void:
	if !FileAccess.file_exists(Settings_File_Path):
		config.set_value("audio", "master_volume", 0.0)
		config.set_value("audio", "sfx_volume", 0.0)
		
		config.set_value("score","highscore", 0)
		
		config.save(Settings_File_Path)
	else :
		config.load(Settings_File_Path)

func save_highscore(score : int):
	config.set_value("score", "highscore", score)
	config.save(Settings_File_Path)

func  load_highscore():
	config.load(Settings_File_Path)
	return config.get_value("score", "highscore", 0)


func  save_audio_setting(key: String, value):
	config.set_value("audio", key, value)
	config.save(Settings_File_Path)

func load_audio_setting():
	var audio_settings = {}
	for key in config.get_section_keys("audio"):
		audio_settings[key] = config.get_value("audio", key)
	return audio_settings
	
func reset_highscore() -> void:
	config.load(Settings_File_Path)
	config.set_value("score", "highscore", 0)
	config.save(Settings_File_Path)
