class_name Blaster
extends Weapon

@onready var location := $ShootLocation

func shoot(direction: Vector2) -> void:
	if not $Cooldown.is_stopped(): return
	
	var new_blast: Blast = ammo.instantiate()
	new_blast.direction = direction
	new_blast.global_position = $ShootLocation.global_position

	get_tree().root.add_child(new_blast)
	
	$Cooldown.start()
