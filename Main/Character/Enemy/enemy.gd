class_name Enemy
extends Character

var target: PhysicsBody2D = null

func _ready() -> void:
	super()

func _physics_process(delta) -> void:
	pass

func _on_player_detect_range_body_entered(body: PhysicsBody2D) -> void:
	if body is Player:
		target = body
	pass # Replace with function body.
