extends CharacterBody2D

@export var health: int = 2
@export var speed = 250
@export var Bullet : PackedScene

func _ready():
	
	#Bullet = load("res://scenes//enemies/enemy_bullet.tscn")
	$AnimatedSprite2D.play("Idle")
	
func _process(delta):
	if $Timer.is_stopped():
		shoot()
	
func _on_hit():
	health -= 1
	if health == 0:
		$AnimatedSprite2D.play("Boom")
		await $AnimatedSprite2D.animation_finished
		queue_free()
		
func shoot():
	var b = Bullet.instantiate()
	get_tree().root.add_child(b)
	b.global_transform = $Chamber.global_transform
	$Timer.start()
