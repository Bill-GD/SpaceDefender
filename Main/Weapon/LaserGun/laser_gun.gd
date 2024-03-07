class_name LaserGun
extends Weapon

@export var length := 5000.
@export var laser_damage_bonus := 3.

@onready var parent := get_parent().get_parent()
@onready var location := $ShootLocation
@onready var ray_cast := $ShootLocation/RayCast
@onready var beam := $ShootLocation/LaserBeam
@onready var from_player := parent is Player

var laser_damage: float
var target_direction := Vector2.ZERO
var is_shooting := false:
	set(value):
		is_shooting = value
		$LaserStart.emitting = is_shooting
		$LaserEnd.emitting = is_shooting
var time_shooting := 0.

func _ready() -> void:
	$Cooldown.wait_time = 1 / PlayerStats.fire_rate
	if from_player:
		length *= PlayerStats.laser_length
	
func _process(delta) -> void:
	target_direction = to_global(Vector2.from_angle(parent.rotation))
	if is_shooting:
		time_shooting += delta
		
		# laser
		ray_cast.target_position = ray_cast.to_local(target_direction).normalized() * -length
		beam.points[1] = ray_cast.target_position * .94
		$LaserEnd.global_position = to_global(ray_cast.target_position)
		$LaserEnd.global_rotation = $LaserEnd.to_local(ray_cast.target_position).angle() * -1
		
		# collision
		if ray_cast.is_colliding():
			var collision = ray_cast.get_collider()
			if $DamageCooldown.is_stopped():
				if collision is Enemy and from_player:
					collision.take_damage(laser_damage)
				if collision is Player and not from_player:
					collision.take_damage(laser_damage)
				$DamageCooldown.start()
				
			var coll_point = ray_cast.get_collision_point()
			beam.points[1] = beam.to_local(coll_point)
			$LaserEnd.global_position = coll_point
			$LaserEnd.global_rotation = ray_cast.get_collision_normal().angle()
		
		# stop attack
		if Input.is_action_just_released("primary_attack"):
			stop_attack()

func shoot(direction: Vector2, damage: float, from_player: bool = true) -> void:
	if is_shooting: return
	if not $Cooldown.is_stopped(): return
	laser_damage = (3 + damage) * laser_damage_bonus
	start_attack()
	
func start_attack() -> void:
	is_shooting = true
	var tween = create_tween()
	tween.tween_property($ShootLocation/LaserBeam, "width", 100, 0.2)

func stop_attack() -> void:
	is_shooting = false
	$Cooldown.wait_time = 1 / PlayerStats.fire_rate + time_shooting / 2
	time_shooting = 0
	print("Laser cooldown: %s" % $Cooldown.wait_time)
	$Cooldown.start()
		
	var tween = create_tween()
	tween.tween_property($ShootLocation/LaserBeam, "width", 0, 0.1)
	await tween.finished
	beam.points[1] = beam.points[0]
