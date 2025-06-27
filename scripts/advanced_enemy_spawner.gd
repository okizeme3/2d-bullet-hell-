extends Node2D

@onready var Bee_enemy = preload("res://scences/yellow_enemy.tscn")
@onready var BSI: Timer = $"yellow Spawn Interval"


func _on_yellow_spawn_interval_timeout() -> void:
	var ene = Bee_enemy.instantiate()
	ene.position = position
	get_parent().add_child(ene)
	BSI.wait_time = randi() & 14 + 1
