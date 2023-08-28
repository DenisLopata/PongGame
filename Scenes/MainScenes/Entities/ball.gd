extends Area2D

var _speed = GameHandler.ball_speed
var direction = Vector2.RIGHT
var nums = [-1,1]

signal ball_reset;

@onready var _initial_pos = position
@onready var _screen_size_y = get_viewport_rect().size.y
@onready var _screen_size_x = get_viewport_rect().size.x

func _ready():
	#postion middle of sreen
	position = Vector2(_screen_size_x/2, _screen_size_y/2)
	_initial_pos = position
	#random left or right
	direction = Vector2(nums[randi() % nums.size()], 0)
	var sprite = get_node("Sprite2D") as Sprite2D
	sprite.transform.y = sprite.transform.y * 4
	sprite.transform.x = sprite.transform.x * 4
	var collision = get_node("Collision") as CollisionShape2D
	collision.transform.y = collision.transform.y * 4
	collision.transform.x = collision.transform.x * 4

func _process(delta):
	_speed += delta * 2
	position += _speed * delta * direction
	
func reset():
	#direction = Vector2.LEFT
	#random left or right
	direction = Vector2(nums[randi() % nums.size()], 0)
	position = _initial_pos
	GameHandler.ball_speed = GameHandler.initial_game_speed
	_speed = GameHandler.initial_game_speed
	ball_reset.emit()
