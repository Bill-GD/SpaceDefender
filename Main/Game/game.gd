extends Node2D

@onready var camera := $Camera2D
@onready var player := $Player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_update_camera_pos(player.global_position)

func _update_camera_pos(new_pos: Vector2) -> void:
	camera.global_position = new_pos
