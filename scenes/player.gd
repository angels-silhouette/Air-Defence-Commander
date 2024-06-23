extends Node2D

# spawnable objects
# aircraft
@export var bomber: Node2D
@export var fighter: Node2D

# radars
@export var radar_small: Node2D
@export var radar_medium: Node2D
@export var radar_large: Node2D

var game: Node2D
var camera_velocity: Vector2

func _ready():
	game = self.get_tree().root.get_child(0)


func _process(delta):
	self.position += camera_velocity
	camera_velocity -= camera_velocity * 0.06
	if camera_velocity.length() < 0.05:
		camera_velocity = Vector2(0, 0)


func _unhandled_key_input(event):
	print(event)
	if Input.is_action_pressed("up"):
		self.camera_velocity.y -= 10
	if Input.is_action_pressed("down"):
		self.camera_velocity.y += 10
	if Input.is_action_pressed("left"):
		self.camera_velocity.x -= 10
	if Input.is_action_pressed("right"):
		self.camera_velocity.x += 10
	if Input.is_action_pressed("in"):
		pass
	if Input.is_action_pressed("out"):
		pass


func _on_exit_button_pressed():
	game.quit_request()
