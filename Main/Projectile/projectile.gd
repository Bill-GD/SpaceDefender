class_name Projectile
extends Area2D

@export var speed: float = 1000
@export var homing: bool = false
## Should be double of speed for better homing
@export var steer_force: float = 1
## Damage multiplier for ammo type
@export var extra_damage: float = 1

var target: PhysicsBody2D = null
var from_player: bool = true
var direction: Vector2
var velocity = Vector2.ZERO
var damage: float = 0
var chasing_target: bool = false

func _ready() -> void:
	var anim: Animation = $AnimationPlayer.get_animation("projectile_despawn")
	anim.track_set_key_value(0, 0, $Sprite.scale)
	
	$DespawnTimer.start()
	look_at(to_global(direction))
	
	if from_player: homing = PlayerStats.homing || homing
	else: homing = false
	
	damage *= extra_damage
	if damage <= 0: print_rich('[color=red]%s damage is 0[/color]' % name)
	
func set_sprite_scale(new_scale: Vector2) -> void:
	$Sprite.scale = new_scale

func seek() -> Vector2:
	var steer := Vector2.ZERO
	if target and is_instance_valid(target):
		var desired = (target.global_position - position).normalized() * speed
		steer = (desired - velocity).normalized() * steer_force
	return steer

func _physics_process(delta) -> void:
	if homing and chasing_target:
		velocity += seek() * delta
		rotation = velocity.angle()
	else:
		velocity = direction * speed

	position += velocity * delta

func _on_despawn_timer_timeout() -> void:
	$AnimationPlayer.play("projectile_despawn")
	while $AnimationPlayer.is_playing():
		await get_tree().create_timer(0.1).timeout
	queue_free()

func _on_homing_range_body_entered(body: CharacterBody2D) -> void:
	if not homing: return
	chasing_target = true
	if body is Enemy and from_player:
		target = body
		return
	if body is Player and not from_player:
		target = body
		return
