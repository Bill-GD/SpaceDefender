class_name Player
extends Character

var attack_cooldown := 1.
var accel: float = 2500
var friction: float = 500

func _ready() -> void:
	update_stats()
	super()

func _physics_process(delta) -> void:
	look_at(get_global_mouse_position())

	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	
	if direction == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (accel * direction * delta)
		velocity = velocity.limit_length(speed)
	
	move_and_collide(velocity * delta)

func take_damage(damage_taken: float) -> void:
	if not $InvincibleTime.is_stopped(): return
	super(damage_taken)
	$InvincibleTime.start()
	$HurtBox.set_deferred("monitoring", false)

func die() -> void:
	super()
	# emit player died signal -> handle game over

func add_weapon(weapon_type: WeaponUtils.WeaponType) -> void:
	if weapon_type in WeaponUtils.player_weapons: return

	WeaponUtils.add_player_weapon(weapon_type)
	var new_weapon: Weapon = load(WeaponUtils.weapon_paths[weapon_type]).instantiate()
	new_weapon.hide()
	
	$Weapon.add_child(new_weapon)

func update_stats() -> void:
	speed *= PlayerStats.speed_mult
	damage *= PlayerStats.damage_mult

func calculate_damage() -> float:
	var result: float = damage
	
	if randf_range(0, 1) <= PlayerStats.crit_chance:
		result = damage * PlayerStats.crit_damage
	
	return result * PlayerStats.damage_mult

func _on_invincible_time_timeout() -> void:
	$HurtBox.set_deferred("monitoring", true)
