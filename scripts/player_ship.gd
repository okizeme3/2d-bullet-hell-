extends CharacterBody2D
@onready var game = get_tree().get_root().get_node("game")
@onready var lazers = load("res://scences/double_lazer.tscn")
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var fire_left: AnimatedSprite2D = $"fire left"
@onready var fire_right: AnimatedSprite2D = $"fire right"
@onready var timer: Timer = $Timer
@onready var lives_label = get_tree().get_first_node_in_group("lives label")
@onready var marker = get_tree().get_first_node_in_group("camera")
@onready var marker_2d: Marker2D = $Marker2D
@onready var shoot_col: Timer = $"shoot intervel"
@onready var expire: Timer = $expire
@onready var screen = get_viewport_rect().size
@onready var hitbox: CollisionShape2D = $CollisionShape2D
@onready var invul_timer: Timer = $"invul timer"
@onready var bhb: CollisionShape2D = $"bullet hit box/bhb"
@onready var respawn_flash: AnimationPlayer = $"Sprite2D/respawn flash"
@onready var dash_cooldown: Timer = $"dash cooldown"
@onready var dash_invi: Timer = $"dash invi"
@export var ghost_node : PackedScene
@onready var ghost_timer: Timer = $"ghost timer"

@export var speed = 150
var alive = true
var lives= 3
var health = 10
var can_shoot = true

const dash = 500.0
var tween: Tween
var dash_velocity = 0.0
var dashing = false

func get_input():
	if alive:
		# handels shooting 
		if Input.is_action_pressed("shoot")and can_shoot:
			shoot()
			can_shoot= false
			shoot_col.start()
		#handles input and velocity
		if Input.is_action_pressed("finner control"):
			speed = 75
		else: speed = 150
		var input_direction = Input.get_vector("left", "right", "up", "down")
		velocity = input_direction * (speed+ dash_velocity)
		#handles dashing 
		if Input.is_action_just_pressed("dash"):
			if !dashing:
				dash_velocity = dash
				if tween:
					tween.stop()
				tween = create_tween()
				tween.tween_property(self, "dash_velocity", 0, 0.2)
				dashing = true
				hitbox.disabled = true
				bhb.disabled = true
				dash_cooldown.start()
				dash_invi.start()
func _physics_process(delta):
	get_input()
	move_and_slide()
func _process(delta: float) -> void:
	#make sure character cant leave the screen
	position = position.clamp(Vector2(-81,-119),Vector2(81,119))
	#handels the hitbox
	if alive == false:
		hitbox.disabled =true
		bhb.disabled = true
		invul_timer.start()

func die():
	alive = false
	velocity.y = 0
	velocity.x = 0
	sprite_2d.play("death")
	fire_left.play("death")
	fire_right.play("death")
	if alive== false and lives>0:
		lives-= 1
		lives_label.text = "X"+ str(lives)
		timer.start()
	else:
		gameover()
func respawn():
	alive = true
	sprite_2d.play("idle")
	fire_left.play("fire")
	fire_right.play("fire")
	position = marker.global_position
	respawn_flash.play("resawn_flash")

func gameover():
	pass

func _on_timer_timeout() -> void:
	respawn()


func  shoot():
	var instance = lazers.instantiate()
	instance.dir = rotation
	instance.spawnpot = marker_2d.global_position
	instance.spawnrot = rotation
	game.add_child.call_deferred(instance)


func _on_shoot_intervel_timeout() -> void:
	can_shoot = true
	

func _on_invul_timer_timeout() -> void:
	hitbox.disabled = false
	bhb.disabled = false


func _on_bullet_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy bullets") and alive:
		die()
		body.expire()

func _on_dash_cooldown_timeout() -> void:
	dashing = false

func _on_dash_invi_timeout() -> void:
	hitbox.disabled = false
	bhb.disabled = false
	
func add_ghost():
	var ghost = ghost_node.instantiate()
	ghost.set_property(position, $Sprite2D.scale)
	get_tree().current_scene.add_child(ghost)

func _on_ghost_timer_timeout() -> void:
	#add_ghost()
	pass

func add_life():
	lives+=1
	lives_label.text = "X"+ str(lives)
