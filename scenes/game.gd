extends Node2D

@export var ENVIRONMENTAL_ACCELERATION: Vector3 = Vector3(0, 0, -9.8) # meters per second per second

@export var number_of_AIs: int = 1
@export var map_size: Vector2i = Vector2i(100, 100)

var entities = []

signal generate_map(map_size)

func _ready():
	generate_map.emit(map_size)

func register_entity(entity):
	entities.append(entity)

func quit_request():
	get_tree().quit()

func exit_to_menu_request():
	var start_menu: Node = load("res://scenes/start_menu.tscn").instantiate()
	add_sibling(start_menu)
	queue_free()
