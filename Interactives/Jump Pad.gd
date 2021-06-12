extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Jump_Pad_body_entered(body: RigidBody2D):
	if body:
		print(body.name)
		body.apply_impulse(Vector2(), Vector2(0, -100))
