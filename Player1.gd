extends RigidBody2D

signal is_anchored(value);

var should_freeze = false;
var lock_position = null;
var other_is_frozen = false;
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
		emit_signal("is_anchored", false)
	if lock_position != null:
		emit_signal("is_anchored", true)
		position = lock_position;
#	if other_is_frozen:
#		gravity_scale = 0
#	else: gravity_scale = 6


func _on_Player2_is_anchored(value):
	other_is_frozen = value

func _on_Player1_is_anchored(value):
	other_is_frozen = value
