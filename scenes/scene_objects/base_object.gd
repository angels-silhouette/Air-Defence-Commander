extends Node2D

var parent: Node2D

# Specifications
@export var radar_cross_section: float # In meters
@export var thermal_signiture: float # In kelvins

# Health
@export var health: float
func change_health(amount: float):
	self.health += amount
	if self.health <= 0:
		self.queue_free()

# Movement
@export var velocity: Vector3 # Vector in meters per second
@export var altitude: float
var speed: float
func update_speed():
	self.speed = sqrt(self.velocity.x**2 + self.velocity.y**2 + self.velocity.z**2)

func rotate_heading(angle: float):
	var previous_heading: float = atan2(self.velocity.y, self.velocity.x)
	var new_heading: float = previous_heading + angle
	self.update_speed()
	self.velocity.x = self.speed * cos(new_heading)
	self.velocity.y = self.speed * sin(new_heading)

func rotate_attitude(angle: float):
	var new_attitude: float = atan(self.velocity.z/sqrt(self.velocity.x**2 + self.velocity.y**2)) + angle
	self.update_speed()
	self.velocity.z = self.speed * sin(new_attitude)

func increase_speed(amount: float):
	pass

func decrease_speed(amount: float):
	pass

func _ready():
	parent = self.get_parent()

func _process(_delta):
	pass
