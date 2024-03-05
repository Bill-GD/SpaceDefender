class_name Player
extends Character

func _physics_process(delta) -> void:
	look_at(get_global_mouse_position())

	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
		
	velocity = direction * basic_stats.base_speed
	move_and_collide(velocity * delta)

#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("primary_attack"):
		#print(event.as_text())
