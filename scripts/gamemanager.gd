extends Node2D
@onready var lives_label: Label = $"labels and textures/lives label"
@onready var player: CharacterBody2D = $"player ship"

var gameOver : bool = false

func _process(delta: float) -> void:
	#check_score()
	pass
	
func score_calculator():
	if gameOver:
		if score > high_score:
			high_score = score
	print(high_score)

var score = 0
var  high_score = 0
func check_score():
	#if score !=0 and score % 100 ==0:
		#bonus()
		pass

func _on_bullet_killzone_body_entered(body: Node2D) -> void:
	if  body.is_in_group("lazer") or body.is_in_group("enemy bullets"):
		body.expire()
func bonus():
	player.add_life()
