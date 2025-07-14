extends Control

var Master_Muted : bool = false
var SFX_Muted: bool = false



func _on_master_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)


func _on_check_box_toggled(toggled_on: bool) -> void:
	if !Master_Muted:
		AudioServer.set_bus_mute(0, true)
		Master_Muted= true
	elif Master_Muted:
		AudioServer.set_bus_mute(0, false)
		Master_Muted = false


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://MENUS/MainMenu.tscn")


func _on_reset_pressed() -> void:
	Gamemanager.high_score = 0 


func _on_sfx_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, value)


func _on_sfx_toggled(toggled_on: bool) -> void:
	if !SFX_Muted:
		AudioServer.set_bus_mute(1, true)
		SFX_Muted= true
	elif SFX_Muted:
		AudioServer.set_bus_mute(1, false)
		SFX_Muted = false
