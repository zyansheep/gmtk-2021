extends KinematicBody2D

var velocity = Vector2()

const MAX_SPEED = 100
const ACCELERATION = 1000
const DECELERATION = 700
const AIR_DECELERATION = 10;

const JUMP_FORCE = 200
const GRAVITY = 500
const MAX_FALL_SPEED = 1000

var jump_count = 0
const MAX_JUMP_COUNT = 2

# Velocity transferred from external state
var next_velocity = null;

func _ready():
	set_process(true)
	set_process_input(true)
	#sprite_node = get_node("Sprite")


func _process(delta):
	var x_direction = null;
	
	if Input.is_action_pressed("game_move_left") && is_on_floor():
		x_direction = -1;
	if Input.is_action_pressed("game_move_right") && is_on_floor():
		x_direction = 1;
	var jump = Input.is_action_pressed("game_move_up") && is_on_floor();
	
	# Movement Acceleration
	if x_direction:
		velocity.x += ACCELERATION * delta * x_direction;
	# Movement Deceleration
	if is_on_floor():
		velocity.x -= DECELERATION * delta;
	else:
		velocity.x -= AIR_DECELERATION * delta;
	# Movement Clamp
	velocity.x = clamp(velocity.x, 0, MAX_SPEED)
	
	# Jumping
	if jump:
		velocity.y -= JUMP_FORCE;
	# Falling
	velocity.y += GRAVITY * delta
	# Terminal Velocity
	if velocity.y > MAX_FALL_SPEED:
		velocity.y = MAX_FALL_SPEED
	
	# Check if external velocity from Join State
	if next_velocity:
		velocity = next_velocity;
		next_velocity = null;
	
	# Move kinematic body
	velocity = move_and_slide(velocity, Vector2.UP);
