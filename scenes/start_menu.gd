extends CenterContainer

func _ready():
	pass

func _process(_delta):
	pass

func _on_start_button_pressed():
	self.get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_quit_button_pressed():
	self.get_tree().quit()
