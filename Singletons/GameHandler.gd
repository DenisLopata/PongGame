extends Node

#levels
const MAP1 := "res://Scenes/Maps/Map1.tscn"
var next_scene = preload("res://Scenes/Maps/Map1.tscn")

var initial_game_speed: int = 200
var ball_speed : int = 200
var map

func change_scene(scene: String) -> void:
#	match scene:
#		"Map1":
#			map = load(MAP1).instantiate()
#		"Map2":
#			load(MAP1).instantiate()
#		_:
#			printerr("Cannot get map scene from name %s" % scene)
#	add_child(map,true)
	get_tree().change_scene_to_packed(next_scene)
#	
#func connect_signal(node: Control) -> void:
#	var primary = get_node(WALLS)
#	primary.connect("update_score", node._on_update_player_score)
