extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var pathing = false;
var baked_points;
var current_point = -1;
var zoom_target = Vector2(1,1)
var zoom_lerp_speed = 0.5;

# Called when the node enters the scene tree for the first time.
func _ready():
	if $CameraPath:
		if !$CameraPath.visible: return
		pathing = true;
		current_point = 0;
		baked_points = $CameraPath.curve.get_baked_points();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	zoom = lerp(zoom, zoom_target, zoom_lerp_speed);
	if pathing:
		zoom_target = Vector2(3.0,3.0);
		if current_point < baked_points.size():
			position = baked_points[current_point];
			current_point += 2;
		else:
			pathing = false;
		return
	
	var player_position_1 = $"../Player 1".position;
	var player_position_2 = $"../Player 2".position;
	
	position = (player_position_1 + player_position_2) / 2;
	var midpoint_dist = (player_position_1 - position)
	var projectResolution=Vector2(ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting("display/window/size/height"))
	var test_zoom = (midpoint_dist * 2 / projectResolution).length();
	var test_zoom_2 = max(test_zoom + 1.5, 1);
	
	zoom_target = Vector2(test_zoom_2, test_zoom_2);
	pass
