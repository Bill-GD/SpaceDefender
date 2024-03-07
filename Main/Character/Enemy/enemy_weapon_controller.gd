# Weapon Controller for Enemy
extends Node2D

@onready var parent: Enemy = get_parent()
var weapon_node: Weapon

func _ready() -> void:
	var count := get_child_count()
	if count <= 0:
		printerr("Weapon Controller couldn't detect any weapon")
	else:
		weapon_node = get_children()[0]
	
		
func _process(_delta) -> void:
	var timer: Timer = parent.get_node("AttackCooldown") as Timer
	if not parent.target: return
	if not timer.is_stopped(): return
	
	var shoot_direction = parent.target.global_position - parent.global_position
	weapon_node.shoot(shoot_direction.normalized(), parent.damage, false)
	timer.start()
		
func _input(event) -> void:
	# Change weapon (wheel)
	pass
