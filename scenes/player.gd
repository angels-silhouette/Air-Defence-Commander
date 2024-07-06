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
@export var camera_sensitivity: int = 100
@export var max_scale: float = 2
@export var min_scale: float = 0.2

var world: Node2D
var camera_velocity: Vector2
var camera_zoom_velocity: float = 0.0

var camera: Camera2D
var ui: Control

func _ready():
	world = self.get_parent()
	camera = self.get_node("Camera2D")
	ui = self.get_node("UI")


func _process(delta):
	# input handling
	if Input.is_action_pressed("up"):
		camera_velocity.y -= camera_sensitivity * delta
	if Input.is_action_pressed("down"):
		camera_velocity.y += camera_sensitivity * delta
	if Input.is_action_pressed("left"):
		camera_velocity.x -= camera_sensitivity * delta
	if Input.is_action_pressed("right"):
		camera_velocity.x += camera_sensitivity * delta
	if Input.is_action_pressed("in"):
		camera_zoom_velocity += camera_sensitivity / 100 * delta
	if Input.is_action_pressed("out"):
		camera_zoom_velocity -= camera_sensitivity / 100 * delta
	
	# movement
	position += camera_velocity
	var zoom_change = Vector2(1, 1) * camera_zoom_velocity
	if zoom_change + camera.zoom > Vector2(1, 1) * max_scale:
		camera.zoom = Vector2(1, 1) * max_scale
		ui.size = self.get_tree().root.size * min_scale
		camera_zoom_velocity = 0
	elif zoom_change + camera.zoom < Vector2(1, 1) * min_scale:
		camera.zoom = Vector2(1, 1) * min_scale
		ui.size = self.get_tree().root.size * max_scale
		camera_zoom_velocity = 0
	else:
		camera.zoom += zoom_change
		ui.size -= zoom_change
	
	print(ui.size)
	
	# deceleartion
	camera_zoom_velocity -= camera_zoom_velocity * 10 * delta
	camera_velocity -= camera_velocity * 2.5 * delta
	if camera_velocity.length() < 0.05:
		camera_velocity = Vector2(0, 0)


func _on_exit_button_pressed():
	world.quit_request()
