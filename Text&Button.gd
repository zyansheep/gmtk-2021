extends RichTextLabel




func _on_StartButton_pressed():
	fade_text_change()
	#get_tree().change_scene("res://Main.tscn")


func fade_text_change():
	self.parse_bbcode = "[fade start=4 length=14][center]" + text + "[/center][/fade]"
