extends StaticBody2D

signal pressed;

var FORCE_REQUIRED = 10

func _on_Area_body_entered(body):
	if body.name.find("Player") != -1:
		#print("Collide:", body.old_velocity.y," vs ",  body.velocity.y)
		if body.velocity.y > FORCE_REQUIRED:
			$Sprite.frame = 1
			$CollisionShape2D.position = Vector2(0,4)
			emit_signal("pressed")


func _on_Area_body_exited(_body):
	pass # Replace with function body.
