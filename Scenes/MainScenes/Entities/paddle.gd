extends Area2D

const MOVE_SPEED = 300

var _ball_dir
var _up
var _down
var is_ai: bool

@onready var _screen_size_y = get_viewport_rect().size.y
@onready var _screen_size_x = get_viewport_rect().size.x

func _ready():
	
	var n = String(name).to_lower()
	_up = n + "_move_up"
	_down = n + "_move_down"
	if n == "left":
		_ball_dir = 1
	else:
		_ball_dir = -1
	calculate_player_position(n)
	set_player_width()

#sets the child sprite and coliision width
func set_player_width(multiplier: int = 4) -> void:
	var sprite = get_node("Sprite2D") as Sprite2D
	sprite.transform.y = sprite.transform.y * multiplier
	var collision = get_node("Collision") as CollisionShape2D
	collision.transform.y = collision.transform.y * multiplier


#set initial player position on screen
func calculate_player_position(name: String):
	var x_offset = 50
	if name == "left":
		position.y = _screen_size_y / 2
		position.x = _screen_size_x - (_screen_size_x - x_offset)
	else:
		position.y = _screen_size_y / 2
		position.x = _screen_size_x - x_offset

func _process(delta):
	var input = Input.get_action_strength(_down) - Input.get_action_strength(_up)
	#image size is 26 px
	#default miltiplier is 2, so we need 52px to stop paddle from exiting screen
	position.y = clamp(position.y + input * MOVE_SPEED * delta, 52, _screen_size_y - 52)
	
func _on_area_entered(area: Area2D):
	if area.name == "Ball":
		#assing new direction
		#area.direction =  Vector2(_ball_dir, randf() * 2 - 1).normalized()
		
		#bounce original vector
		area.direction = area.direction.bounce(area.direction)
		print(area.position)
		#get angle between paddle and ball
		var angle = area.position.angle_to_point(self.position)	
		print(angle)	
		var vector_angle = Vector2.from_angle(angle)
		print(vector_angle)
		#adjust angle of ball after bounce
		var angle_direction: Vector2 = area.direction - vector_angle		
		area.direction = angle_direction.normalized()
		print(area.direction)
