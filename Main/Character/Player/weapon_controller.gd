# Weapon Controller for Player
extends Node2D

@onready var player: Player = get_parent()

var weapon_node: Weapon = null
var weapon_index: int = 0

func _ready() -> void:
	var count := get_child_count()
	if count <= 0:
		printerr("Weapon Controller couldn't detect any weapon")
	else:
		for child in get_children(): child.hide()
		set_weapon(weapon_index)
		
func _process(_delta) -> void:
	if Input.is_action_pressed("primary_attack"):
		var shoot_direction = get_global_mouse_position() - player.global_position
		weapon_node.shoot(shoot_direction.normalized(), player.calculate_damage())
		
		if weapon_node is LaserGun:
			weapon_node.target_direction = to_global(Vector2.from_angle(player.rotation))
		
func set_weapon(index: int) -> void:
	if weapon_node: weapon_node.hide()
	weapon_node = get_children()[index]
	weapon_node.show()
		
func _input(event) -> void:
	# Change weapon (wheel)
	var weapon_count := get_child_count()
	if event.is_pressed() and not event.is_echo():
		if event.is_action("wheel_down"):
			print('Next weapon')
			weapon_index += 1
		if event.is_action("wheel_up"):
			print('Prev weapon')
			weapon_index -= 1
		
		weapon_index %= weapon_count
		set_weapon(weapon_index)
