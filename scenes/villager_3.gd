extends CharacterBody2D
@onready var bubble: AnimatedSprite2D = $AnimatedSprite2D2
@onready var apple: Node2D = $"../Apple"
@onready var done: AnimatedSprite2D = $AnimatedSprite2D3
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
		
func _process(delta):
	if player_in_range and Input.is_action_just_pressed("interact"):
		if apple.visible:
			bubble.visible = !bubble.visible
		else:
			bubble.visible = false
			done.visible = !done.visible
			
			
	
