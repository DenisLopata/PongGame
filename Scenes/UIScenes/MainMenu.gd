@tool
extends Node2D

#signal on_main_menu_new_game_pressed()
@onready var mainMenu := $MainMenu

func _ready():
	$MainMenu/M/VB/NewGame.connect("pressed", self.on_new_game_pressed)

func on_new_game_pressed():
	$MainMenu.queue_free()
	#on_main_menu_new_game_pressed.emit()
	GameHandler.change_scene("Map1")

#func _on_scene_handler_game_start():
#	print("pressed")



