extends Node2D

# spawnable objects
# aircraft
@export var bomber: Node2D
@export var fighter: Node2D

# radars
@export var radar_small: Node2D
@export var radar_medium: Node2D
@export var radar_large: Node2D

# GUI
var velocity: Vector2 = Vector2(0, 0)
var zoom_velocity: float = 0.0
var velocity_sensitivity: int = 100
var zoom_sensitivity: float = 0.3
var zoom_decerlation: float = 12.0
var velocity_decerlation: float = 2.5
var max_scale: float = 5
var min_scale: float = 0.1

@onready var world: Node2D = self.get_parent()
@onready var camera: Camera2D = $Camera2D

func _process(delta):
	var velocity_zoom_coefficent = 1 / camera.zoom.length()

	if Input.is_action_pressed("up"):
		velocity.y -= velocity_sensitivity * velocity_zoom_coefficent * delta
	if Input.is_action_pressed("down"):
		velocity.y += velocity_sensitivity * velocity_zoom_coefficent * delta
	if Input.is_action_pressed("left"):
		velocity.x -= velocity_sensitivity * velocity_zoom_coefficent * delta
	if Input.is_action_pressed("right"):
		velocity.x += velocity_sensitivity * velocity_zoom_coefficent * delta
	if Input.is_action_pressed("in"):
		zoom_velocity += zoom_sensitivity * delta
	if Input.is_action_pressed("out"):
		zoom_velocity -= zoom_sensitivity * delta

	# movement
	position += velocity
	var zoom_change = Vector2(1, 1) * zoom_velocity
	if zoom_change + camera.zoom > Vector2(1, 1) * max_scale:
		camera.zoom = Vector2(1, 1) * max_scale
		zoom_velocity = 0
	elif zoom_change + camera.zoom < Vector2(1, 1) * min_scale:
		camera.zoom = Vector2(1, 1) * min_scale
		zoom_velocity = 0
	else:
		camera.zoom += zoom_change

	# deceleartion
	zoom_velocity -= zoom_velocity * zoom_decerlation * delta
	velocity -= velocity * velocity_decerlation * delta
	if velocity.length() < 0.05:
		velocity = Vector2(0, 0)

func _on_quit_button_pressed() -> void:
	world.quit_request()


func _on_exit_to_menu_button_pressed() -> void:
	world.exit_to_menu_request()


func _on_exit_button_pressed() -> void:
	pass # Replace with function body.
