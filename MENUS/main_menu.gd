extends Control

var button_type = null

func _on_play_pressed() -> void:
	button_type = "play"
	$fade_timer.start()
	$fade/fade_animation.play("fade_in")
	#get_tree().change_scene_to_file("res://scences/game.tscn")

	

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://MENUS/Options.tscn")
	
func _on_quit_pressed() -> void:
	button_type = "quit"
	$fade_timer.start()
	$fade/fade_animation.play("fade_in")
	#get_tree().quit()


func _on_fade_timer_timeout() -> void:
	if button_type == "play":
		get_tree().change_scene_to_file("res://scences/game.tscn")
	elif button_type== "quit":
		get_tree().quit()
