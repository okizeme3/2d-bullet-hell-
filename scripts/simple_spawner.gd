extends Node2D

@onready var Green_enemy = preload("res://scences/green_enemy.tscn")
@onready var Robot_enemy = preload("res://scences/robot_enemy.tscn")
@onready var GSI: Timer = $"Green spawn interval"
@onready var RSI: Timer = $"robot spawn Interval"
var GSI_num = 10
var RSI_num = 12

func _on_green_spawn_interval_timeout() -> void:
	var ene = Green_enemy.instantiate()
	ene.position = position
	get_parent().add_child(ene)
	GSI.wait_time = randi() & GSI_num + 1
	checkScore()


func _on_robot_spawn_interval_timeout() -> void:
	var ene = Robot_enemy.instantiate()
	ene.position = position
	get_parent().add_child(ene)
	RSI.wait_time  = randi() & RSI_num + 1
	checkScore()
	
func checkScore():
	if Gamemanager.score < 500:
		GSI_num = 10
		RSI_num =12
	elif 500 <=Gamemanager.score and Gamemanager.score <= 1000:
		GSI_num = 6
		RSI_num = 8
	elif 1001 <=Gamemanager.score:
		GSI_num = 4
		RSI_num = 6
