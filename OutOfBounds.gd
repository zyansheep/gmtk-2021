extends Area2D

func _on_OutOfBounds_body_exited(body):
	get_tree().reload_current_scene()
