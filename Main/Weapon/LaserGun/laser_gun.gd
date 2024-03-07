class_name LaserGun
extends Weapon

@export var length := 5000.
@export var damage := 1.5

@onready var location := $ShootLocation
@onready var ray_cast := $ShootLocation/RayCast
@onready var beam := $ShootLocation/LaserBeam

var target_direction := Vector2.ZERO
var is_shooting := false:
	set(value):
		is_shooting = value
		$LaserStart.emitting = is_shooting
		$LaserEnd.emitting = is_shooting
var time_shooting := 0.
var from_player := true

func _ready() -> void:
	super()
	length *= PlayerStats.laser_length
	
func calculate_damage() -> float:
	var result: float = damage
	
	if randf_range(0, 1) <= PlayerStats.crit_chance:
		result = damage * PlayerStats.crit_damage
	
	return result * PlayerStats.damage_boost
	
func _process(delta) -> void:
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
			if collision is Enemy and from_player:
				collision.take_damage(calculate_damage())
				
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
	start_attack()
	
func start_attack() -> void:
	is_shooting = true
	var tween = create_tween()
	tween.tween_property($ShootLocation/LaserBeam, "width", 100, 0.2)

func stop_attack() -> void:
	is_shooting = false
	$Cooldown.wait_time = 0.5 + time_shooting / 2
	print('%s Cooldown: %s' % [name, $Cooldown.wait_time])
	time_shooting = 0
	$Cooldown.start()
		
	var tween = create_tween()
	tween.tween_property($ShootLocation/LaserBeam, "width", 0, 0.1)
	await tween.finished
	beam.points[1] = beam.points[0]
