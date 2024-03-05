class_name HealthBar
extends ProgressBar

func set_max_value(new_max_value: float) -> void:
	max_value = new_max_value
	
func update_value(new_value: float) -> void:
	value = new_value
