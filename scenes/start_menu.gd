extends CenterContainer

@onready var game = preload("res://scenes/game.tscn").instantiate()
var number_of_AIs: int = 1

func _ready():
	pass

func _process(_delta):
	pass


func _on_start_button_pressed():
	game.initialise_world(number_of_AIs)
	self.get_tree().change_scene_to_packed(game)
	self.get_tree().unload_current_scene()
	# self.get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_quit_button_pressed():
	self.get_tree().quit()


func _on_number_of_AIs_value_changed(value: float) -> void:
	number_of_AIs = int(value)
