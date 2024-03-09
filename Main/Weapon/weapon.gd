class_name Weapon
extends Node2D

@export var ammo: PackedScene

func shoot(_direction: Vector2, _damage: float, _is_from_player: bool=true) -> void:
	print('Base method, not implemented')
	pass
