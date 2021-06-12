extends RichTextLabel


onready var timer = get_node("../SceneTimer")

# true = start | false = exit
var command = true

func _on_StartButton_pressed():
	fade_text_change()
	timer.start(.75)
	command = true

func _on_ExitButton_pressed():
	fade_text_change()
	timer.start(.75)
	command = false

func fade_text_change():
	self.parse_bbcode("[center][shake rate=10 level=20]" + text + "[/shake][/center]")


func _on_SceneTimer_timeout():
	if command:
		get_tree().change_scene("res://Main.tscn")
	else:
		get_tree().quit()



