class_name DoubleRocketLauncher
extends Weapon

@onready var locations := $ShootLocation

func shoot(direction: Vector2, damage: float, from_player: bool = true) -> void:
	for point in locations.get_children():
		var rocket: Rocket = ammo.instantiate()
		rocket.direction = direction
		rocket.global_position = point.global_position
		rocket.damage = damage
		rocket.from_player = from_player

		get_tree().root.add_child(rocket)
