extends "res://scripts/double_lazer.gd"



func _physics_process(delta):
	velocity = Vector2(0,speed).rotated(dir)
	move_and_slide()
