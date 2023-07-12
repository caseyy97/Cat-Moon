extends RigidBody2D

@onready var duration_timer = get_node("DurationTimer")
@onready var animation_player = get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	# set a random x position, set y position to always be 0
	position.x = randf_range(50, 590)
	position.y = 0
	# set a random rotation
	global_rotation_degrees = randf_range(0, 360)
	# add a random amount of force between 0 and 200
	add_constant_force(Vector2(randf_range(0, 200), randf_range(0, 200)))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	star_despawn_check()

# remove star when it exits the screen
func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func star_despawn_check():
	var blink_time = 4
	var despawn_time = 0
	var remaining_time = floor(duration_timer.time_left)

	if(remaining_time <= blink_time && remaining_time > 0):
		animation_player.play("blink")
	elif(remaining_time == despawn_time):
		queue_free()
