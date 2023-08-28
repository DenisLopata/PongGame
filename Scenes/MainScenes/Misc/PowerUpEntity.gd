class_name PowerUpEntity

extends Area2D

var sprite_texture: Texture2D
var is_good: bool
var type: PowerUpType

enum PowerUpType {
	SLOW_BALL = 0,
	SPLIT_BALL = 1
}

func split_ball() -> void:
	GameHandler.ball_speed = 500
	
func slow_ball() -> void:
	GameHandler.ball_speed = GameHandler.initial_game_speed

func get_type_data(entity: PowerUpEntity)-> PowerUpEntity:
	match(entity.type):
		PowerUpType.SLOW_BALL:
			var imported_resource = preload("res://Assets/Environment/PowerUps/share2.png")
			entity.sprite_texture = imported_resource
		PowerUpType.SPLIT_BALL:
			var imported_resource = preload("res://Assets/Environment/PowerUps/fastForward.png")
			entity.sprite_texture = imported_resource
		_:
			pass
	return entity
