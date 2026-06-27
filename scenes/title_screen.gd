extends CenterContainer

var number_of_AIs: int = 1
var size_of_map: int = 100

func _on_start_button_pressed() -> void:
	var game: Node = preload("res://scenes/game.tscn").instantiate()
	game.number_of_AIs = number_of_AIs
	game.map_size = Vector2i(1, 1) * size_of_map * 100
	add_sibling(game)
	queue_free()

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_number_of_AIs_value_changed(value: float) -> void:
	number_of_AIs = int(value)

func _on_size_of_map_value_changed(value: float) -> void:
	size_of_map = int(value)
