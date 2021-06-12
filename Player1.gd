extends RigidBody2D


var should_freeze = false;
var lock_position = null;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if should_freeze && lock_position == null:
		lock_position = position;
	if !should_freeze && lock_position != null:
		lock_position = null;
	if lock_position != null:
		position = lock_position;
