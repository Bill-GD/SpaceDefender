class_name Enemy
extends Character

var target: PhysicsBody2D = null
var can_attack := false

func _ready() -> void:
	super()
	target = %Player

func _physics_process(delta) -> void:
	if target and is_instance_valid(target):
		var target_direction := target.global_position - global_position
		look_at(target.global_position)
		
		velocity = target_direction.normalized() * min(speed, target_direction.length() / 2)
		move_and_collide(velocity * delta)

func _on_attack_range_body_entered(body: PhysicsBody2D) -> void:
	if body is Player:
		can_attack = true

func _on_attack_range_body_exited(body: PhysicsBody2D) -> void:
	if body is Player:
		can_attack = false
