class_name Blaster
extends Weapon

@onready var location := $ShootLocation

func shoot(direction: Vector2, damage: float, from_player: bool = true) -> void:
	var new_blast: Blast = ammo.instantiate()
	new_blast.direction = direction
	new_blast.global_position = $ShootLocation.global_position
	new_blast.damage = damage
	new_blast.from_player = from_player

	get_tree().root.add_child(new_blast)
