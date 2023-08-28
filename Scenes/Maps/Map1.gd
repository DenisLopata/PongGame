extends Node2D

@onready var game_speed := $GameSpeed as Timer
@onready var HUD := $UI/HUD as Control
@onready var power_up := $PowerUp as Area2D

func _ready():
	
	#set timer
	game_speed.start()
	update_info_text("Speed: ", str(GameHandler.ball_speed))
	
func _process(delta):
	if game_speed.time_left <= 3:
		update_info_text("Speed change in: ", str(int(game_speed.time_left)))
		

# increment ball speed
func _on_game_speed_timeout():
	GameHandler.ball_speed = GameHandler.ball_speed * 2
	update_info_text("Speed: ", str(GameHandler.ball_speed))


func _on_ball_ball_reset():
	update_info_text("Speed: ", str(GameHandler.ball_speed))
	power_up.reset_power_up()


func _on_power_up_area_entered(area):
	if area.name == "Ball":
		power_up.take_effect()
		update_info_text("Speed: ", str(GameHandler.ball_speed))
		power_up.reset_power_up()

func update_info_text(prefix: String, text: String) -> void:
	HUD.update_FPS_text(prefix + str(text))
