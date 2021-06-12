extends RichTextLabel

onready var timer = get_node("../SceneTimer")

func _on_Button_pressed():
	if self.name == "Start":
		get_tree().change_scene("res://Levels/Level1.tscn")
	elif self.name == "Exit":
		get_tree().quit()

func _on_Button_mouse_entered():
	self.parse_bbcode("[center][shake rate=10 level=20]" + text + "[/shake][/center]")

func _on_Button_mouse_exited():
	self.parse_bbcode("[center]" + text + "[/center]")
