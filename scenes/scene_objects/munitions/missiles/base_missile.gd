extends "res://scenes/scene objects/munitions/base_munition.gd"

# Specifications
@export var fuel: float # In seconds
@export var acceleration: float # In meters per second per second
@export var turn_rate_decrease_rate: float # In radians per second decrease per velocity (approaches infinate at 0 velocity)
@export var energy_retention_from_turn: float # In loss of speed (meters per second) per radians turned

var target: Node2D
var target_coordinates: Vector3

func course_correction():
    pass

func _ready():
    pass # Replace with function body.

func _process(delta):
    pass
