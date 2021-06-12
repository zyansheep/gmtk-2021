extends KinematicBody2D

export(String) var left_action = "game_move_left";
export(String) var right_action = "game_move_right";
export(String) var jump_action = "game_move_up";

var velocity = Vector2()
var speed_x = 0

const MAX_SPEED = 100
const ACCELERATION = 1000
const DECELERATION = 7
const AIR_DECELERATION = 1;

const JUMP_FORCE = 200
const GRAVITY = 400
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
	
	if Input.is_action_pressed(left_action):
		x_direction = -1;
	if Input.is_action_pressed(right_action):
		x_direction = 1;
	var jump = Input.is_action_pressed(jump_action) && is_on_floor();
	
	var dir = sign(velocity.x);
	# Movement Acceleration
	if x_direction != null:
		velocity.x += x_direction * ACCELERATION * delta;
	# Movement Deceleration
	if is_on_floor():
		velocity.x = lerp(velocity.x, 0, DECELERATION * delta);
	else:
		velocity.x = lerp(velocity.x, 0, AIR_DECELERATION * delta);
	
	# Movement Clamp
	velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
	
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
