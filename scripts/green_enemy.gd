extends Area2D
@onready var double_lazer = get_tree().get_first_node_in_group("lazer")
@onready var player_ship = get_tree().get_first_node_in_group("player")
@onready var score: Label = $"../labels and textures/score"

func _process(delta: float) -> void:
	position.y += 1

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and body.has_method("die"):
		if body.alive:
			body.die()
	if body.is_in_group("lazer"): 
		death()
		body.hit_enemy = true
		Gamemanager.score += 10
		body.expire()

func death():
	queue_free()
