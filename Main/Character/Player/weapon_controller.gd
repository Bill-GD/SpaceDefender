# Weapon Controller for Player
extends Node2D

@onready var player: Player = get_parent()
var weapon_node: Weapon

func _ready() -> void:
	var count := get_child_count()
	if count <= 0:
		printerr("Weapon Controller couldn't detect any weapon")
	else:
		weapon_node = get_children()[0]
	
		
func _process(_delta) -> void:
	if Input.is_action_pressed("primary_attack"):
		var shoot_direction = get_global_mouse_position() - player.global_position
		weapon_node.shoot(shoot_direction.normalized(), player.calculate_damage())
		
func _input(event) -> void:
	# Change weapon (wheel)
	pass
