extends Control

var called: bool = false

func _process(delta: float) -> void:
	if Gamemanager.gameOver and !called:
		$fade/fade_animation.play("fade_in")
		called = true
func _ready() -> void:
	$fade/fade_animation.play("fade_out")
