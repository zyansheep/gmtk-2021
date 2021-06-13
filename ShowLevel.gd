extends Camera2D

onready var nav = $Line2D
onready var path = nav.points
onready var timer = $PathTimer
var pathNumber = 0

func _process(_delta):
	var remaining_distance = position.distance_to(path[pathNumber])
	if 1 <= remaining_distance:
		self.position += position.direction_to(path[pathNumber])
	else:
		if timer.is_stopped():
			timer.start(.1)



func _on_PathTimer_timeout():
	if pathNumber + 1 < path.size():
		pathNumber = pathNumber + 1
	else: 
		$"../../Camera2D".current = true
