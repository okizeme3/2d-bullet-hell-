extends Control

var paused = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func _on_resume_pressed() -> void:
	self.hide()
	get_tree().paused = false
	paused = !paused


func _on_quit_pressed() -> void:
	#get_tree().paused = false
	#get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
	pass

func  pauseMenu():
	
	if paused:
		self.hide()
		get_tree().paused = false
	else:
		self.show()
		get_tree().paused= true 
	paused = !paused
