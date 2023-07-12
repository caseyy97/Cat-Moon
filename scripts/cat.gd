extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var velocity_limit = 1000
@export var jump_force = 500
@onready var animated_sprite = $Sprite

func _ready():
	position.x = 320
	position.y = 0
	print(animated_sprite)

func _physics_process(delta):
	
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > velocity_limit:
			velocity.y = velocity_limit
		animated_sprite.play("jump")
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = -jump_force
			
	var hor_direction = Input.get_axis("move_left", "move_right")
	velocity.x = speed * hor_direction
	
	# handle running and idle animations
	if Input.is_action_pressed("move_right"):
		animated_sprite.flip_h = false
		animated_sprite.play("run")
	elif Input.is_action_pressed("move_left"):
		animated_sprite.flip_h = true
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	
	move_and_slide()
