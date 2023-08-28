extends Area2D

@export var _bounce_direction = 1
@onready var _screen_size_y = get_viewport_rect().size.y
@onready var _screen_size_x = get_viewport_rect().size.x

signal update_score(player: String)

func _on_area_entered(area: Area2D):
	var node_name = self.name
	var area_name = area.name
	if node_name == "Ceiling":
		_bounce_direction = 1
	elif node_name == "Floor":
		_bounce_direction = -1
	if area.name == "Ball":
		area.direction = (area.direction + Vector2(0, _bounce_direction)).normalized()
	if area_name == "Left":
		print("pressed")


func _on_side_wall_area_entered(area: Area2D):
	var wall_name = self.name
	var player_name = ""
	if wall_name.to_lower().contains("left"):
		player_name = "right"
	elif wall_name.to_lower().contains("right"):
		player_name = "left"
		
	var area_name = area.name
	if area.name == "Ball":
		#oops, ball went out of game place, reset
		area.reset()
		emit_signal("update_score", player_name)

