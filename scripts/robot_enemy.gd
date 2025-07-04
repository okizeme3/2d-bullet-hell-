extends Area2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var direction_change: Timer = $"direction change"
@onready var double_lazer = get_tree().get_first_node_in_group("lazer")
@onready var player_ship = get_tree().get_first_node_in_group("player")
@onready var DT: Timer = $"death timer"
@onready var hitbox: CollisionShape2D = $CollisionShape2D

var alive = true
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
		if alive:
			if body.alive:
				body.die()
	if body.is_in_group("lazer"): 
		if alive:
			Gamemanager.score += 20
			body.expire()
		death()

func death():
	alive = false
	hitbox.disabled = true
	sprite_2d.play("death")
	await sprite_2d.animation_finished
	queue_free()

func move_left():
	if alive:
		position += Vector2(1,1).normalized() 
	else : position = position
func move_right():
	if alive:
		position += Vector2(-1,1).normalized() 
	else : position = position

func set_direction():
	if position.x >0:
		direction = -1
	else:
		direction = 1

func _on_direction_change_timeout() -> void:
	direction*= -1
