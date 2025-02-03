extends TileMapLayer

@onready var game = get_parent()

var fnl = FastNoiseLite.new()

func _ready() -> void:
	game.generate_map.connect(generate_map)

func generate_map(map_size):
	for x in map_size.x:
		for y in map_size.y:
			set_cell(Vector2i(x, y), 0, Vector2i(10, 0))
