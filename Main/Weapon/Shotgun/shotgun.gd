class_name Shotgun
extends Weapon

@export var blast_count: int = 5
@export var spread_degree: int = 30

@onready var location := $ShootLocation

func shoot(direction: Vector2, damage: float, from_player: bool=true) -> void:
	var spread_rad: float = deg_to_rad(spread_degree)

	for i in blast_count:
		var new_blast: Blast = ammo.instantiate()
		new_blast.direction = direction.rotated(randf_range( - spread_rad, spread_rad))
		new_blast.global_position = $ShootLocation.global_position
		new_blast.damage = damage
		new_blast.from_player = from_player
		new_blast.set_despawn_timer(0.1)

		get_tree().root.add_child(new_blast)
