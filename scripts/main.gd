extends Node

@export var cat_scene: PackedScene
@export var moon_scene: PackedScene
@export var star_scene: PackedScene
@onready var global_vars = get_node("/root/GlobalVars")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func spawn_star():
	var star = star_scene.instantiate()
	add_child(star)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_star_timer_timeout():
	spawn_star()

func _on_time_elapsed_timeout():
	global_vars.increase_time()
