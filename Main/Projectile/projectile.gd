class_name Projectile
extends Area2D

@export var speed: float = 1000
@export var homing: bool = false

var target: Character = null
var direction: Vector2
var velocity = Vector2.ZERO

func _ready() -> void:
	$DespawnTimer.start()
	look_at(to_global(direction))

func seek():
	var steer := Vector2.ZERO
	if target:
		var desired = (target.global_position - position).normalized() * speed
		steer = (desired - velocity).normalized() * speed
	return steer

func _physics_process(delta):
	if homing:
		velocity += seek() * delta
		rotation = velocity.angle()
	else: velocity += direction * speed * delta
	position += velocity * delta

func _on_despawn_timer_timeout():
	queue_free()

func _on_homing_range_body_entered(body: CharacterBody2D):
	#if body is Enemy:
	if not homing: return
	target = body
