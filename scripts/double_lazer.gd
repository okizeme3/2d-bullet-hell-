extends CharacterBody2D
@export var speed = 200
@onready var expiretime: Timer = $expire

var dir : float
var spawnpot : Vector2
var spawnrot : float
var hit_enemy = false

func _ready() -> void:
	global_position = spawnpot
	global_rotation = spawnrot
func _physics_process(delta):
	velocity = Vector2(0,-speed).rotated(dir)
	move_and_slide()
func expire():
	queue_free()
