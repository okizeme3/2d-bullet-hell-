extends state

@onready var YE = get_parent().get_parent()



func _on_entrance_1_timeout() -> void:
	state_machine.change_state("beemode")
