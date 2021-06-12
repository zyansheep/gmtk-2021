extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func position_from_nodes(node1: KinematicBody2D, node2: KinematicBody2D):
	$Player1.position = node1.position
	$Player2.position = node2.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#$center.global_position = position;
	pass
	
