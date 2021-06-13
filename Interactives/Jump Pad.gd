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
		
		#body.add_central_force(Vector2(0, -100))
		var reverse_impulse = (body.linear_velocity.length() * body.mass) * 2;
		body.apply_central_impulse(Vector2.UP.rotated(rotation) * (100 + reverse_impulse))
