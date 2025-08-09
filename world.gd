extends Node2D

const TILE_SIZE = 32

const WALKABLE_TILES = [Tile.Path, Tile.Floor]

enum Tile {
	Floor, 
	Path, 
	Wall, 
	Ocean
}

@onready var tile_map = $TileMap
@onready var player = $Player
@onready var control = get_node(".")

var player_tile
var map = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event): 
	if !event.is_pressed(): 
		return
	if event.is_action("Left"): 
		try_move(-1, 0)
	elif event.is_action("Right"): 
		try_move(1, 0)
	elif event.is_action("Up"): 
		try_move(0, -1)
	elif event.is_action("Down"): 
		try_move(0, 1)

func try_move(dx, dy): 
	var x = player_tile.x + dx
	var y = player_tile.y + dy
	var tile_type = map[x][y]
	
	if tile_type in WALKABLE_TILES and tile_type != Tile.Wall:
		var blocked = false
		if !blocked: 
			player_tile = Vector2(x, y)
		
	update_visuals()

func update_visuals(): 
	player.position = player_tile * TILE_SIZE + Vector2(TILE_SIZE / 2, TILE_SIZE / 2)
	
func tile_to_id(x: int, y: int) -> int:
	return x + y # * int(level_size.x)
		
func set_tile(x, y, id):
	x = int(x)
	y = int(y)
	if x < 0 or x >= map.size() or typeof(map[x]) != TYPE_ARRAY or y < 0 or y >= map[x].size():
		print("Invalid map coordinate: (", x, ",", y, ")")
		return
	
	if id < 0 or id >= Tile.size():
		push_error("🚨 Invalid Tile ID: %s" % id)
		return

	map[int(x)][int(y)] = id
	var coords = Vector2i(x, y)

	tile_map.erase_cell(0, coords)
	tile_map.set_cell(0, coords, id, Vector2i(0,0))
