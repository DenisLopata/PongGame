extends Control

var score_left = 0
var score_right = 0

@onready var score_left_node = $InfoBar/H/ScoreLeft as Label
@onready var score_right_node  = $InfoBar/H/ScoreRight as Label
@onready var FPS  = $InfoBar/H/FPS as Label


func _ready():
	update_score_val("")

func _process(delta):
#	FPS.set_text("FPS: " + str(Engine.get_frames_per_second()))
	pass
	
#updates left or right player score
#set them to 0 if not matched by name
func update_score_val(name: String) -> void:
	match (name):
		"left":
			score_left += 1
			score_left_node.set_text(str(score_left))
		"right":
			score_right += 1
			score_right_node.set_text(str(score_right))
		_:
			score_left_node.set_text(str(0))
			score_right_node.set_text(str(0))
			
			

func update_FPS_text(text: String) -> void:
	FPS.set_text(text)
