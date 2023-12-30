extends CharacterBody2D

@export var SPEED = 100
@onready var animated_sprite_2d = $AnimatedSprite2D
var current_direction = "none"

func _ready():
	animated_sprite_2d.play("idle")

func _physics_process(_delta):
	player_movement(_delta)
	
func player_movement(delta):
	if Input.is_action_pressed("up"):
		current_direction = "up"
		play_animation(1)
		velocity.y = -SPEED
		velocity.x = 0
	elif Input.is_action_pressed("down"):
		current_direction = "down"
		play_animation(1)
		velocity.y = SPEED
		velocity.x = 0
	elif Input.is_action_pressed("left"):
		current_direction = "left"
		play_animation(1)
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_action_pressed("right"):
		current_direction = "right"
		play_animation(1)
		velocity.x = SPEED
		velocity.y = 0
	else: 
		play_animation(0)
		velocity = Vector2.ZERO
	
	
	move_and_slide()

func play_animation(movement):
	var dir = current_direction
	if dir == "right":
		animated_sprite_2d.flip_h = false
		if movement == 1:
			animated_sprite_2d.play("side_walk")
		elif movement == 0:
			animated_sprite_2d.play("side_idle")
	if dir == "left":
		animated_sprite_2d.flip_h = true
		if movement == 1:
			animated_sprite_2d.play("side_walk")
		elif movement == 0:
			animated_sprite_2d.play("side_idle")
	if dir == "up":
		if movement == 1:
			animated_sprite_2d.play("back_walk")
		elif movement == 0:
			animated_sprite_2d.play("back_idle")
	if dir == "down":
		if movement == 1:
			animated_sprite_2d.play("front_walk")
		elif movement == 0:
			animated_sprite_2d.play("idle")
