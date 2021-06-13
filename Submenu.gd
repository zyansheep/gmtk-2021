extends CanvasLayer

onready var pop = $PopupMenu

func _process(_delta):
	if Input.is_action_just_pressed("escape"):
		pop.popup()
		get_tree().paused = true

func hide_menu():
	pop.hide()
