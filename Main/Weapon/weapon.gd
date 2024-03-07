class_name Weapon
extends Node2D

@export var ammo: PackedScene

func _ready() -> void:
	update_fire_rate()

func shoot(direction: Vector2, damage: float, from_player: bool = true) -> void:
	print('Base method, not implemented')
	pass

func update_fire_rate() -> void:
	if get_parent().get_parent() is Player:
		$Cooldown.wait_time /= PlayerStats.fire_rate

func _on_cooldown_timeout():
	#print('%s cooldown is over' % name)
	pass
