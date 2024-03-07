class_name Player
extends Character

var attack_cooldown := 1.

func _ready() -> void:
	get_base_stats(base_stats)
	update_stats()
	super()

func _physics_process(delta) -> void:
	look_at(get_global_mouse_position())

	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
		
	velocity = direction * speed
	move_and_collide(velocity * delta)
	
func update_stats() -> void:
	speed *= PlayerStats.speed_boost
	damage *= PlayerStats.damage_boost
	
func calculate_damage() -> float:
	var result: float = damage
	
	if randf_range(0, 1) <= PlayerStats.crit_chance:
		result = damage * PlayerStats.crit_damage
	
	return result * PlayerStats.damage_boost
	
func _on_invincible_time_timeout():
	$HurtBox.set_deferred("monitoring", true)

#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("primary_attack"):
		#print(event.as_text())
