extends Control


var Muted : bool = false
var SFX_Muted= false
@onready var PM = get_tree().get_first_node_in_group("PauseMenu")

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
	self.hide()
	PM.margin_container.show()
	PM.label.show()


func _on_sfx_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, value)



func _on_sfx_toggled(toggled_on: bool) -> void:
	if !SFX_Muted:
		AudioServer.set_bus_mute(1, true)
		SFX_Muted= true
	elif SFX_Muted:
		AudioServer.set_bus_mute(1, false)
		SFX_Muted = false
