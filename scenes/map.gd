extends Polygon2D


func _ready() -> void:
	get_parent().generate_map.connect(generate_map)

func generate_map(map_size: Vector2i):
	scale = map_size

func get_terrain_height() -> int:
	return 0
