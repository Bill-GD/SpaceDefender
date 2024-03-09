# Weapon Controller for Player
extends Node2D

@onready var player: Player = get_parent()
@onready var atk_cooldown = player.get_node("AttackCooldown") as Timer

var weapon_node: Weapon = null
var weapon_index: int = 0

func _ready() -> void:
	var count := get_child_count()
	if count <= 0:
		printerr("Player Weapon Controller couldn't detect any weapon")
	else:
		for child in get_children(): child.hide()
		set_weapon(weapon_index)
		update_fire_rate()

func _process(_delta) -> void:
	if Input.is_action_pressed("primary_attack"):
		if weapon_node is LaserGun:
			var shoot_direction = get_global_mouse_position() - player.global_position
			weapon_node.shoot(shoot_direction.normalized(), player.calculate_damage())
		elif atk_cooldown.is_stopped():
			var shoot_direction = get_global_mouse_position() - player.global_position
			weapon_node.shoot(shoot_direction.normalized(), player.calculate_damage())
			atk_cooldown.start()

func set_weapon(index: int) -> void:
	if weapon_node: weapon_node.hide()
	weapon_node = get_children()[index]
	print_rich('[color=green]Set Player weapon to %s[/color]' % weapon_node.name)
	weapon_node.show()

func update_fire_rate() -> void:
	atk_cooldown.wait_time = 1 / PlayerStats.fire_rate

func _input(event: InputEvent) -> void:
	if not event.is_action("wheel_down") and not event.is_action("wheel_up"): return
	var weapon_count := get_child_count()
	if event.is_pressed() and not event.is_echo():
		if event.is_action("wheel_down"):
			weapon_index += 1
		if event.is_action("wheel_up"):
			weapon_index -= 1
		
		weapon_index %= weapon_count
		set_weapon(weapon_index)
