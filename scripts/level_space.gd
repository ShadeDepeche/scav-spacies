extends Node2D
@onready var anim_play: AnimationPlayer = $AnimPlay
##Currently not in used in this test level
@export var scrolling_speed = 400

func _ready() -> void:
	anim_play.play("anim_test")


func change_track(track_name: String):
	match track_name:
		"round_2":
			anim_play.play("round_2")
		"boss":
			$Stars2.autoscroll = Vector2(-25,0)
			#spawn the boss, and must kill the boss to trigger next track change.
			pass


func enemy_spawn(spawn_name: String):
	match spawn_name:
		"ambush_1":
			#just a test code
			pass
