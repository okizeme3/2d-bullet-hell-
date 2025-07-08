extends TextureButton

var focused = false

func _process(delta: float) -> void:
	if !focused:
		activate_grab()
	if focused:
		deactivate_grab()


func activate_grab():
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down"):
		get_viewport().set_input_as_handled()
		focused = true

func deactivate_grab():
	if Input.is_action_just_pressed("shoot") and has_focus():
		release_focus()
		focused = false
