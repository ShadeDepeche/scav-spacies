extends Node2D

@export var Ship : PackedScene
@export var Level : PackedScene

func _ready():
	Ship = load("res://Ship.tscn")
	Level = load("res://Level.tscn")
	start_game()

func start_game():
	var level = Level.instantiate()
	add_child(level)
	var ship = Ship.instantiate()
	add_child(ship)
