extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func position_from_nodes(node1_pos: Vector2, node2_pos: Vector2):
	var center = (node1_pos + node2_pos) / 2;
	position = center;
	var position1 = node1_pos - center;
	var position2 = node2_pos - center;
	$Icon1.position = position1;
	$Collision1.position = position1;
	$Icon2.position = position2;
	$Collision2.position = position2;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
