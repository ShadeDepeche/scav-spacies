extends Area2D
signal hit

@export var speed = 400
var screen_size

@export var Bullet : PackedScene

#func _ready():
	#screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("shoot") and $Timer.is_stopped():
		shoot()

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play("Idle")
	else:
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screen_size)
	var camera = get_viewport().get_camera_2d()
	if camera:
		var cam_rect = get_camera_visible_rect(camera)
		global_position = global_position.clamp(cam_rect.position, cam_rect.position + cam_rect.size)

func _on_hit():
	$AnimatedSprite2D.play("Boom")
	await get_tree().create_timer(0.4).timeout
	queue_free()

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func shoot():
	var b = Bullet.instantiate()
	get_tree().root.add_child(b)
	b.global_transform = $Chamber.global_transform
	$Timer.start()

func get_camera_visible_rect(camera: Camera2D) -> Rect2:
	var screen_size = get_viewport().get_visible_rect().size /1.1
	var half_screen = screen_size * 0.5
	var top_left = camera.global_position - half_screen
	return Rect2(top_left, screen_size)
