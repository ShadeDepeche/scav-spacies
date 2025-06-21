extends Area2D

var speed = 400

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body: Node2D) -> void:
	body._on_hit()
	queue_free()
