extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$fade/AnimationPlayer.play("fade_out")
