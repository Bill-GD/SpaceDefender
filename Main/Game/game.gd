extends Node2D

@onready var camera := $Camera2D
@onready var player := $Player

func _process(_delta) -> void:
	_update_camera_pos(player.global_position)

func _update_camera_pos(new_pos: Vector2) -> void:
	camera.global_position = new_pos

# func _input(event: InputEvent) -> void:
# 	if event.is_action_pressed("move_boost"):
# 		%Player.add_weapon(WeaponUtils.WeaponType.SHOTGUN)
