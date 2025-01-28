class_name SingleRocketLauncher
extends Weapon

@onready var location := $ShootLocation

func shoot(direction: Vector2, damage: float, from_player: bool = true) -> void:
	var rocket: Rocket = ammo.instantiate()
	rocket.direction = direction
	rocket.global_position = $ShootLocation.global_position
	rocket.damage = damage
	rocket.homing = true
	rocket.from_player = from_player

	get_tree().root.add_child(rocket)
