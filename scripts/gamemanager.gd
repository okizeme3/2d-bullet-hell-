extends Node2D
@onready var lives_label: Label = $"labels and textures/lives label"
@onready var player: CharacterBody2D = $"player ship"
@onready var fade_timer: Timer = $fade_timer

var gameOver : bool = false
var MasterVolume: float = 0.0
var SFXVolume : float = 0.0

func _ready() -> void:
	ConfigHandler.load_audio_setting()
	
func _process(delta: float) -> void:
	#check_score()
	if gameOver:
		pass
	

func score_calculator():
	if gameOver:
		if score > high_score:
			high_score = score
			ConfigHandler.save_highscore(high_score)
	print(high_score)

var score = 0
@onready var high_score: int  = ConfigHandler.load_highscore()

func check_score():
	#if score !=0 and score % 100 ==0:
		#bonus()
		pass

func _on_bullet_killzone_body_entered(body: Node2D) -> void:
	if  body.is_in_group("lazer") or body.is_in_group("enemy bullets"):
		body.expire()
	if body.is_in_group("enemy"):
		body.queue_free()
func bonus():
	player.add_life()
	

	


func _on_fade_timer_timeout() -> void:
	get_tree().paused = true
	get_tree().change_scene_to_file("res://MENUS/Game_Over.tscn")
