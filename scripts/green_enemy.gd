extends Area2D
@onready var double_lazer = get_tree().get_first_node_in_group("lazer")
@onready var player_ship = get_tree().get_first_node_in_group("player")
@onready var score: Label = $"../labels and textures/score"
@export var Explosion : PackedScene

func _process(delta: float) -> void:
	position.y += 1

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and body.has_method("die"):
		if body.alive:
			body.die()
	if body.is_in_group("lazer"): 
		var explosion_instance = Explosion.instantiate()
		explosion_instance.position = position
		get_parent().add_child(explosion_instance)
		explosion_instance.modulate = Color8(50, 201, 79)
		explosion_instance.emitting = true
		death()
		body.hit_enemy = true
		Gamemanager.score += 10
		body.expire()

func death():
	queue_free()
