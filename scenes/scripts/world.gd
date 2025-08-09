extends Node2D

const TILE_SIZE = 16

@onready var tile_map = $TileMap
@onready var control = get_node(".")

var player_tile
var map = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func tile_to_id(x: int, y: int) -> int:
	return x + y # * int(level_size.x)
		
func set_tile(x, y, id):
	x = int(x)
	y = int(y)
	if x < 0 or x >= map.size() or typeof(map[x]) != TYPE_ARRAY or y < 0 or y >= map[x].size():
		print("Invalid map coordinate: (", x, ",", y, ")")
		return

	map[int(x)][int(y)] = id
	var coords = Vector2i(x, y)

	tile_map.erase_cell(0, coords)
	tile_map.set_cell(0, coords, id, Vector2i(0,0))
