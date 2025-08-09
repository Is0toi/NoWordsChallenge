extends CharacterBody2D
var player_in_range := false
@onready var bubble: AnimatedSprite2D = $InteractionZone/AnimatedSprite2D2
@onready var fire: AnimatedSprite2D = $InteractionZone/AnimatedSprite2D3

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
		
func _process(delta):
	if player_in_range and Input.is_action_just_pressed("interact"):
		bubble.visible = !bubble.visible
		fire.visible = !fire.visible
	
