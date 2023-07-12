extends Node

var score = 0
var timer = 0
@onready var score_label = get_node("../Main/ScoreLabel")
@onready var timer_label = get_node("../Main/TimeElapsed/TimeLabel")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(score_label)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func increase_score():
	score += 1
	score_label.text = "SCORE: " + str(score)

func increase_time():
	timer += 1
	timer_label.text = "TIME: " + str(timer)
