extends Node2D

# Environmental constants
@export var ENVIRONMENTAL_ACCELERATION: Vector3 = Vector3(0, 0, -9.8) # meters per second per second

var entities = []

func _ready():
	pass

func _process(_delta):
	pass

func register_entity(entity):
	print(entity)
	entities.append(entity)

func quit_request():
	self.get_tree().quit()

func exit_to_menu_request():
	self.get_tree().change_scene_to_file("res://scenes/start_menu.tscn")
