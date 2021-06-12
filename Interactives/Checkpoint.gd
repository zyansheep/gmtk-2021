extends Sprite

export (PackedScene) var next_level;

func _on_DetectWin_body_entered(_body):
	if next_level:
		print("Next Level!")
		get_tree().change_scene_to(next_level);
	else:
		print("No Level Found")
	pass # Replace with function body.
