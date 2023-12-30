extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var speed = 25
var player_chase = false
var player = null

func _ready():
	animated_sprite_2d.play("idle")
	
func _physics_process(delta):
	if player_chase:
		position += (player.position - position).normalized() * speed * delta
		animated_sprite_2d.play("walk")
		
		if (player.position.x - position.x) < 0:
			animated_sprite_2d.flip_h = true
		else:
			animated_sprite_2d.flip_h = false
		move_and_collide(Vector2.ZERO)
	else: 
		animated_sprite_2d.play("idle")

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
