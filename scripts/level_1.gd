extends ParallaxLayer

var scrolling_speed = 1000

func _process(delta):
	motion_offset.x -= scrolling_speed * delta * 0.1
