extends "res://scenes/scene objects/base_object.gd"

# The specifications of the aircraft
@export var turn_rate_fast: float # In radians per second (the rate of turn as it approaches cruise speed)
@export var turn_rate_slow: float # In radians per second (the rate of turn when it is slower than crusise speed)
@export var energy_retention_from_turn: float # In loss of speed (meters per second) per radians turned
@export var acceleration: float # In meters per second per second
@export var rate_of_climb: float # In meters per second

@export var cruising_speed: float # In meters per second
@export var cruising_altitude: float # In meters

# Targeting
var target: Node2D
var target_coordinates: Vector3

func _ready():
    pass

func _process(_delta):
    pass
