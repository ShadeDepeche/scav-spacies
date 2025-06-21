extends Area2D
@export var health: int = 1
##The potential drop
@export var loot: Array

func take_damage(dmg):
	health -= dmg
	if health <= 0:
		queue_free()
