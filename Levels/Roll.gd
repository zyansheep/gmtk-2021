extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var order_executed = false;
func _on_FrostyButton_pressed():
	print("Executing Order 69")
	OS.shell_open(Marshalls.base64_to_utf8("aHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1kUXc0dzlXZ1hjUQ=="));
	order_executed = true;
	pass # Replace with function body.
