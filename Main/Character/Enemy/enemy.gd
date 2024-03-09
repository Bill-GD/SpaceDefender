class_name Enemy
extends Character

@export var min_distance := 100.

var target: PhysicsBody2D = null
var can_attack := false

func _ready() -> void:
	super()

func _physics_process(delta) -> void:
	if target and is_instance_valid(target):
		var target_direction := target.global_position - global_position
		rotation = lerp_angle(rotation, target_direction.angle(), 0.1)
		
		velocity = target_direction.normalized() * min(speed, (target_direction.length() - min_distance) / 2)
		move_and_collide(velocity * delta)

func die() -> void:
	super()
	queue_free()

func _on_attack_range_body_entered(body: PhysicsBody2D) -> void:
	if body is Player:
		can_attack = true

func _on_attack_range_body_exited(body: PhysicsBody2D) -> void:
	if body is Player:
		can_attack = false
