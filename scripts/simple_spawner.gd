extends Node2D

@onready var Green_enemy = preload("res://scences/green_enemy.tscn")
@onready var Robot_enemy = preload("res://scences/robot_enemy.tscn")
@onready var GSI: Timer = $"Green spawn interval"
@onready var RSI: Timer = $"robot spawn Interval"


func _on_green_spawn_interval_timeout() -> void:
	var ene = Green_enemy.instantiate()
	ene.position = position
	get_parent().add_child(ene)
	GSI.wait_time = randi() & 10 + 1


func _on_robot_spawn_interval_timeout() -> void:
	var ene = Robot_enemy.instantiate()
	ene.position = position
	get_parent().add_child(ene)
	RSI.wait_time  = randi() & 12 + 1
