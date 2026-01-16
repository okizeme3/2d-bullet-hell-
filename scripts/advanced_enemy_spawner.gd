extends Node2D

@onready var Bee_enemy = preload("res://scences/yellow_enemy.tscn")
@onready var BSI: Timer = $"yellow Spawn Interval"
var BSI_num = 14

func _on_yellow_spawn_interval_timeout() -> void:
	var ene = Bee_enemy.instantiate()
	ene.position = position
	get_parent().add_child(ene)
	BSI.wait_time = randi() & BSI_num + 1
	checkScore()


func checkScore():
	if Gamemanager.score < 500:
		BSI_num = 14
	elif 500 <=Gamemanager.score and Gamemanager.score <= 1000:
		BSI_num = 10
	elif 1001 <=Gamemanager.score:
		BSI_num = 8
