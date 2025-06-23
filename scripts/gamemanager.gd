extends Node2D
@onready var player = get_tree().get_first_node_in_group("player")
@onready var lives_label: Label = $"labels and textures/lives label"

func _process(delta: float) -> void:
	check_score()

var score = 0

func check_score():
	if score !=0 and score % 100 ==0:
		bonus()

func _on_bullet_killzone_body_entered(body: Node2D) -> void:
	if  body.is_in_group("lazer") or body.is_in_group("enemy bullets"):
		body.expire()
func bonus():
	player.add_life()
