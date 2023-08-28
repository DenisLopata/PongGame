@tool
extends Control

@onready var _screen_size_y = get_viewport_rect().size.y
@onready var _screen_size_x = get_viewport_rect().size.x

func _draw() -> void:
	
	#draw line on half the screen
	draw_line(Vector2(_screen_size_x/2, 0), Vector2(_screen_size_x/2, _screen_size_y), Color.BLUE, 2.0)


