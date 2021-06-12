extends Node2D




var join;
var join_scene = preload("res://Player Join.tscn");




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene();
		return
	
	if Input.is_action_just_pressed("game_player_join"):
		# Hide Kinematic Bodies
		$"Player 1".visible = false;
		$"Player 2".visible = false;
		# Enable Rigid Body
		join = join_scene.instance();
		join.position_from_nodes($"Player 1", $"Player 2");
		join.get_node("Player1").linear_velocity = $"Player 1".velocity;
		join.get_node("Player2").linear_velocity = $"Player 2".velocity;
		join.get_node("Player1").rotation = $"Player 1".rotation;
		join.get_node("Player2").rotation = $"Player 2".rotation;
		add_child(join);
	
	if join:
		$"Player 1".position = join.get_node("Player1").global_transform.get_origin();
		$"Player 2".position = join.get_node("Player2").global_transform.get_origin();
		$"Player 1".rotation = join.get_node("Player1").rotation;
		$"Player 2".rotation = join.get_node("Player2").rotation;
		
	if Input.is_action_just_released("game_player_join"):
		$"Player 1".visible = true;
		$"Player 2".visible = true;
		if join:
			$"Player 1".next_velocity = join.get_node("Player1").linear_velocity;
			$"Player 2".next_velocity = join.get_node("Player2").linear_velocity;
		
			join.visible = false;
			join.queue_free();
