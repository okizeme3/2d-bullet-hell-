extends Area2D
@onready var player_ship = get_tree().get_first_node_in_group("player")
@onready var drill = load("res://scences/bee_drill.tscn")
@onready var marker_2d: Marker2D = $Marker2D
@onready var game = get_tree().get_root().get_node("game")
@onready var shoot_interval: Timer = $"shoot interval"

var direction = 1
var i = 0
var can_shoot = true
var attacking = false

func _ready() -> void:
	set_direction()
func  _process(delta: float) -> void:
	if can_shoot and attacking == false:
		shoot()
		can_shoot = false
		shoot_interval.start()
	#make sure enemy cant leave the screen
	position = position.clamp(Vector2(-81,-119),Vector2(81,119))
	if attacking == false:
		if direction == -1:
			move_left()
		if direction == 1:
			move_right()
	if attacking:
		attack()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and body.has_method("die"):
		if body.alive:
			body.die()
	if body.is_in_group("lazer"): 
		death()
		Gamemanager.score += 30
		body.expire()

func death():
	queue_free()

func  shoot():
	var instance = drill.instantiate()
	instance.dir = rotation
	instance.spawnpot = marker_2d.global_position
	instance.spawnrot = rotation
	game.add_child.call_deferred(instance)

func move_left():
	position.x -= 1
func move_right():
	position.x +=  1

func _on_shoot_interval_timeout() -> void:
	can_shoot = true

func set_direction():
	if position.x >0:
		direction = -1
	else:
		direction = 1

func  attack():
	position.y += 1
	if global_position.x > player_ship.global_position.x:
		global_position.x += -1
	if global_position.x < player_ship.global_position.x:
		global_position.x += 1

func _on_move_interval_timeout() -> void:
	direction *= -1


func _on_attack_timer_timeout() -> void:
	attacking = true
