class_name Character
extends CharacterBody2D

signal died

@export var basic_stats: BasicStats

func die() -> void:
	print_rich("[color=red]%s has died[/color]" % name)
	queue_free()

func take_damage(damage: float) -> void:
	basic_stats.health -= damage
	pass
