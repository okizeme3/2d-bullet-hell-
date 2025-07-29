extends AudioStreamPlayer

var paused : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if !paused:
			stream_paused = true
			paused = true
		if paused:
			stream_paused= false
			paused = false


func _on_finished() -> void:
	self.play()
