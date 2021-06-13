extends Sprite

export (PackedScene) var next_level;

func _on_DetectWin_body_entered(body):
	if body.name.find("Player") != -1:
		if next_level:
			print("Next Level!")
			$"../OutOfBounds".disabled = true;
			get_tree().change_scene_to(next_level);
		else:
			print("No Level Found")
