# Weapon Controller for Enemy
extends Node2D

@onready var parent: Enemy = get_parent()
var weapon_node: Weapon

func _process(_delta) -> void:
	var timer: Timer = parent.get_node("AttackCooldown") as Timer
	if not parent.target: return
	if not timer.is_stopped(): return
	if not parent.can_attack: return
	
	var shoot_direction = Vector2.from_angle(parent.rotation)
	weapon_node.shoot(shoot_direction.normalized(), parent.damage, false)
	timer.start()

func update_weapon() -> void:
	var count := get_child_count()
	if count <= 0:
		printerr("Enemy Weapon Controller couldn't detect any weapon")
	else:
		weapon_node = get_children()[0]
		print_rich('[color=green]Set %s weapon to %s[/color]' % [parent.name, weapon_node.name])
