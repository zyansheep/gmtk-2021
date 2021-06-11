extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var join;
var join_scene = preload("res://Player Join.tscn");

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Player Join".visible = false;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("game_player_join"):
		# Hide Kinematic Bodies
		$"Player 1".visible = false;
		$"Player 2".visible = false;
		# Enable Rigid Body
		
		join = join_scene.instance();
		join.position_from_nodes($"Player 1".position, $"Player 2".position);
		add_child(join);
	if Input.is_action_just_released("game_player_join"):
		$"Player 1".visible = true;
		$"Player 2".visible = true;
		$"Player 1".position = join.get_node("Icon1").global_transform.get_origin();
		$"Player 2".position = join.get_node("Icon2").global_transform.get_origin();
		
		join.visible = false;
		join.queue_free();
