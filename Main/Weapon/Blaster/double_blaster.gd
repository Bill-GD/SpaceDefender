class_name DoubleBlaster
extends Weapon

@onready var locations := $ShootLocation

func shoot(direction: Vector2) -> void:
	if not $Cooldown.is_stopped(): return
	
	for point in locations.get_children():
		var new_blast: Blast = ammo.instantiate()
		new_blast.direction = direction
		new_blast.global_position = point.global_position

		get_tree().root.add_child(new_blast)
	
	$Cooldown.start()
