extends Control

var paused = false
@onready var options: Control = $options
@onready var margin_container: MarginContainer = $MarginContainer
@onready var label: Label = $Label
@onready var elevator: AudioStreamPlayer = $elevator

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func _on_resume_pressed() -> void:
	self.hide()
	elevator.stop()
	get_tree().paused = false
	paused = !paused


func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MENUS/MainMenu.tscn")

func  pauseMenu():
	
	if paused:
		elevator.stop()
		self.hide()
		get_tree().paused = false
	else:
		elevator.play()
		self.show()
		get_tree().paused= true 
	paused = !paused


func _on_restart_pressed() -> void:
	Gamemanager.score = 0
	get_tree().paused = false
	paused = ! paused
	get_tree().reload_current_scene()


func _on_options_pressed() -> void:
	margin_container.hide()
	label.hide()
	options.show()
