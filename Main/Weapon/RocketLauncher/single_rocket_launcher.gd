class_name SingleRocketLauncher
extends Weapon

@onready var location := $ShootLocation

func shoot(direction: Vector2, damage: float, from_player: bool = true) -> void:
	if not $Cooldown.is_stopped(): return
	
	var new_blast: Rocket = ammo.instantiate()
	new_blast.direction = direction
	new_blast.global_position = $ShootLocation.global_position
	new_blast.damage = damage
	new_blast.homing = true
	new_blast.from_player = from_player

	get_tree().root.add_child(new_blast)
	
	$Cooldown.start()
