extends Node2D

var worlds = []

func _ready():
	pass

func _process(_delta):
	pass

func add_world(world):
	worlds.append(world)

func quit_request():
	self.get_tree().quit()
