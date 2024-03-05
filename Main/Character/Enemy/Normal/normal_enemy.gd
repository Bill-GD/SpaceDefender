class_name NormalEnemy
extends Enemy

func _ready() -> void:
	get_base_stats(base_stats)
	super()

func _physics_process(delta) -> void:
	if target:
		look_at(target.global_position)
	pass
