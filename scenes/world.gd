extends Node2D

# Environmental constants
@export var ENVIRONMENTAL_ACCELERATION: Vector3 = Vector3(0, 0, -9.8) # meters per second per second

var entities = []

var game: Node2D

func _ready():
	game = self.get_parent()


func _process(delta):
	pass

func register_entity(entity):
	print(entity)
	entities.append(entity)

func quit_request():
	game.quit_request()
