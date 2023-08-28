extends Node2D

@onready var mainMenu := $MainMenu

func _ready():
	pass
	#mainMenu.connect("mainMenu.on_main_menu_new_game_pressed", _on_scene_handler_game_start)
	#mainMenu.game_loaded.connect(Callable(self, "_on_scene_handler_game_start"))
#
#signal game_loaded()
#
#func game_start():
#	print("start")

#func _on_scene_handler_game_start():
#	print("start")

