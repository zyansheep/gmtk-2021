extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("game_player_join"):
		$"Player 1".visible = false;
		$"Player Join/Icon1".position = $"Player 1".position;
		$"Player Join/Collision1".position = $"Player 1".position;
		$"Player 2".visible = false;
		$"Player Join/Icon2".position = $"Player 2".position;
		$"Player Join/Collision2".position = $"Player 2".position;
		$"Player Join".mode = RigidBody2D.MODE_RIGID;
		$"Player Join".sleeping = false;
		$"Player Join".visible = true;
	if Input.is_action_just_released("game_player_join"):
		$"Player 1".visible = true;
		$"Player 1".position = $"Player Join/Icon1".global_transform.get_origin();
		$"Player 2".visible = true;
		$"Player 2".position = $"Player Join/Icon2".global_transform.get_origin();
		
		$"Player Join".mode = RigidBody2D.MODE_STATIC;
		$"Player Join".sleeping = true;
		$"Player Join".visible = false;
		$"Player Join".position = Vector2(0, 0);
		$"Player Join".rotation = 0.0;
