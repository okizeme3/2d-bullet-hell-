extends Control

@onready var highscore: Label = $Highscore
@onready var fade_timer: Timer = $fade_timer
var buttion_type = null
@onready var score: Label = $score

func _ready() -> void:
	$fade/fade_animation.play("fade_out")
	score.text = "score: " + str(Gamemanager.score)
	highscore.text = "Highscore: " + str(Gamemanager.high_score)

func _on_quit_pressed() -> void:
	buttion_type = "quit"
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MENUS/MainMenu.tscn")
	


func _on_restart_pressed() -> void:
	buttion_type = "restart"
	$fade/fade_animation.play("fade_in")
	fade_timer.start()


func _on_fade_timer_timeout() -> void:
	if buttion_type == "quit":
		get_tree().paused = false
		get_tree().change_scene_to_file("res://MENUS/MainMenu.tscn")
	elif buttion_type == "restart":
		get_tree().paused = false
		Gamemanager.gameOver = false
		Gamemanager.score = 0
		get_tree().change_scene_to_file("res://scences/game.tscn")
