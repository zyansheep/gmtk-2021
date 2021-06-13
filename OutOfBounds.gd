extends Area2D

export(bool) var disabled = false;

func _on_OutOfBounds_body_exited(body):
	if body.name.find("Player") != -1 && !disabled:
		print("Player went out of bounds!");
		get_tree().reload_current_scene()
