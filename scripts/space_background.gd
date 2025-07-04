extends ParallaxBackground

@onready var black_back: ParallaxLayer = $"black Back"
@onready var far_stars: ParallaxLayer = %"far stars"
@onready var mid_stars: ParallaxLayer = %"mid stars"
@onready var close_stars: ParallaxLayer = %"close stars"


func _process(delta: float) -> void:
	close_stars.motion_offset.y += 20 * delta
	mid_stars.motion_offset.y += 10 * delta
	far_stars.motion_offset.y += 5 * delta
