class_name Projectile
extends Area2D

@export var speed: float = 1000
var direction: Vector2

func _ready() -> void:
	look_at(to_global(direction))

func _process(delta) -> void:
	position += delta * direction * speed
	pass
