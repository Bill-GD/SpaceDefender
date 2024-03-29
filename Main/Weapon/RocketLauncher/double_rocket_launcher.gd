class_name DoubleRocketLauncher
extends Weapon

@onready var locations := $ShootLocation

func shoot(direction: Vector2, damage: float, from_player: bool = true) -> void:
	for point in locations.get_children():
		var new_blast: Rocket = ammo.instantiate()
		new_blast.direction = direction
		new_blast.global_position = point.global_position
		new_blast.damage = damage
		new_blast.from_player = from_player

		get_tree().root.add_child(new_blast)
