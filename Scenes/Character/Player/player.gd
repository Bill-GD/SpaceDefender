class_name Player
extends Character

func _physics_process(delta) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	velocity = direction * basic_stats.speed
	move_and_slide()

	look_at(get_global_mouse_position())

func _input(event: InputEvent) -> void:
	print(event.as_text())
