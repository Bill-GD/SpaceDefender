class_name Weapon
extends Node2D

@export var ammo: PackedScene

func shoot(direction: Vector2, damage: float, from_player: bool = true) -> void:
	print('Base method, not implemented')
	pass
