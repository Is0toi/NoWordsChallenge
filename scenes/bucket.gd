extends Area2D

@onready var apple: Node2D = $"../AnimatedSprite2D"
@onready var bubble: AnimatedSprite2D = $"../Villager/InteractionZone/AnimatedSprite2D2"
var player_in_range := false

func _ready():
	body_entered.connect(_on_body_entered) 

func _on_body_entered(body):
	if body.is_in_group("player") and bubble.visible:
		player_in_range = true
		apple.visible = false
