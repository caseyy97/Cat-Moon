extends AnimatableBody2D

@onready var cat = get_node("../Cat")

# Called when the node enters the scene tree for the first time.
func _ready():
	global_position.x = 320
	rotation_degrees = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	
	var cat_pos = 0
	var base_pos = 320
	var rotation_limit = clamp(20, 1, 21)
	var rotation_change = clamp(2, 1, 2)
	var rotation_mod = 1000

	if(cat != null):
		cat_pos = cat.position.x

	# rotate moon based on player position
	if(rotation_degrees <= rotation_limit && rotation_degrees >= -rotation_limit):
		rotation_degrees += (cat_pos - 320) / rotation_mod
	elif(rotation_degrees > rotation_limit):
		rotation_degrees = rotation_limit
	elif(rotation_degrees < -rotation_limit):
		rotation_degrees = -rotation_limit
