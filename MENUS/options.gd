extends Control

var Muted : bool = false



func _on_master_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)


func _on_check_box_toggled(toggled_on: bool) -> void:
	if !Muted:
		AudioServer.set_bus_mute(0, true)
		Muted = true
	elif Muted:
		AudioServer.set_bus_mute(0, false)
		Muted = false


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://MENUS/MainMenu.tscn")
