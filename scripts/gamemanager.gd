extends Node2D
@onready var player = get_tree().get_first_node_in_group("player")

var score = 0

func check_score():
	pass

func _on_bullet_killzone_body_entered(body: Node2D) -> void:
	if  body.is_in_group("lazer") or body.is_in_group("enemy bullets"):
		body.expire()
func add_life():
	pass
