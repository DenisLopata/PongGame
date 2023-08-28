extends CanvasLayer

@onready var HUD = $HUD as Control

func _on_left_wall_update_score(player: String) -> void:
	HUD.update_score_val("right")


func _on_right_wall_update_score(player: String) -> void:
	HUD.update_score_val("left")
