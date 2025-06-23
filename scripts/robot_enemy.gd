extends Area2D

@onready var direction_change: Timer = $"direction change"
@onready var double_lazer = get_tree().get_first_node_in_group("lazer")
@onready var player_ship = get_tree().get_first_node_in_group("player")

var direction = 1
func  _ready() -> void:
	set_direction()
	
func _process(delta: float) -> void:
	if direction == 1:
		move_left()
	if direction == -1:
		move_right()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and body.has_method("die"):
		if body.alive:
			body.die()
	if body.is_in_group("lazer"): 
		death()
		Gamemanager.score += 20
		body.expire()

func death():
	queue_free()
func move_left():
	position += Vector2(1,1).normalized()
func move_right():
	position += Vector2(-1,1).normalized()

func set_direction():
	if position.x >0:
		direction = -1
	else:
		direction = 1

func _on_direction_change_timeout() -> void:
	direction*= -1
