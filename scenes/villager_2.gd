extends CharacterBody2D
@onready var bubble: AnimatedSprite2D = $AnimatedSprite2D2
var player_in_range := false


func _ready():
	$AnimatedSprite2D.play("default")
	$InteractionZone.body_entered.connect(_on_body_entered)
	$InteractionZone.body_exited.connect(_on_body_exited)
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_range = false
<<<<<<< HEAD
		
	
=======
>>>>>>> 24452e950d9777b6c8862c0a8b39e5a722112d0b
