extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_position_1 = $"../Player 1".position;
	var player_position_2 = $"../Player 2".position;
	
	position = (player_position_1 + player_position_2) / 2;
	var projectResolution=Vector2(ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting("display/window/size/height"))
	var test_zoom = ((player_position_1 - player_position_2) / projectResolution).length();
	var test_zoom_2 = max(test_zoom + 0.4, 1);
	
	zoom = Vector2(test_zoom_2, test_zoom_2);
	pass
