extends PowerUpEntity

@onready var _screen_size: Vector2 = get_viewport_rect().size
@onready var spaw_time := $SpawnTime as Timer
@onready var sprite := $Sprite as Sprite2D

var pwr_up: PowerUpEntity
#var power_ups: Array[PowerUpEntity] = [PowerUpEntity.new(), PowerUpEntity.new()]

func _ready():
	start_timer()
	visible = false

func start_timer() -> void:
	spaw_time.one_shot = true
	spaw_time.start()
	
func reset_power_up() -> void:
	visible = false
	start_timer()

func take_effect() -> void:
	var type = pwr_up.type
	match(type):
		PowerUpType.SLOW_BALL:
			pwr_up.slow_ball()
		PowerUpType.SPLIT_BALL:
			pwr_up.split_ball()
		_:
			pass

#handle timer timeout
func _on_spawn_time_timeout():
	spaw_time.stop()
	
	generate_random_power_up()

	var rand_x = randi_range(100, int(_screen_size.x - 100))
	var rand_y = randi_range(100, int(_screen_size.y - 100))
	position = Vector2(rand_x, rand_y)
	visible = true
	
func generate_random_power_up() -> void:
	pwr_up = PowerUpEntity.new()
	pwr_up.type = PowerUpType.values()[randi() % PowerUpType.size()]
	sprite.texture = pwr_up.get_type_data(pwr_up).sprite_texture
