extends ParallaxLayer

@export var Enemy : PackedScene
var scrolling_speed = 1000

func _ready():
	Enemy = load("res://scenes/enemies/test_enemy.tscn")
	var enemy = Enemy.instantiate()
	add_child(enemy)
	
func _process(delta):
	motion_offset.x -= scrolling_speed * delta * 0.1
