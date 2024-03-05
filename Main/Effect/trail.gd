extends Line2D

@export var length: int = 20
var queue: Array[Vector2]

func _process(_delta) -> void:
	global_position = Vector2(0, 0)
	global_rotation = 0
	
	var point: Vector2 = get_parent().global_position
	
	queue.push_front(point)
	if queue.size() > length:
		queue.pop_back()
		
	clear_points()
	for p in queue:
		add_point(p)
