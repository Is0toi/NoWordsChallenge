extends CharacterBody2D

var TILE_SIZE = 16
	
func _input(event): 
	if !event.is_pressed(): 
		return
	if event.is_action("Left"): 
		move_and_collide(Vector2(-1 * TILE_SIZE, 0))
	elif event.is_action("Right"): 
		move_and_collide(Vector2(1 * TILE_SIZE, 0))
	elif event.is_action("Up"): 
		move_and_collide(Vector2(0, -1 * TILE_SIZE))
	elif event.is_action("Down"): 
		move_and_collide(Vector2(0, 1 * TILE_SIZE))
